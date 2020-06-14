require_relative '../scraper'
require 'pry'
require 'awesome_print'
require 'colorize'
require 'uri'
require 'open-uri'
require 'nokogiri'
require 'chronic'
require 'fileutils'
require 'pdf-reader'

##########
# A web scraper for automatically fetching data from the
# Florida Department of Emergency Management
# at: http://www.floridahealth.gov

module Scraper
  class FDOH

    @@first_page_only = false

    def news_url
      'http://www.floridahealth.gov/newsroom/all-articles.html'
    end

    # Update the Google Sheets spreadsheet that stores the raw data, from the
    # latest updates at the FDOH web site.
    def update
      puts (' Updating raw data from the ' +
        'Florida Department of Health ').
        colorize(color: :white, background: :blue)

      walk_update_urls
    end

    # Get a list of URLs for the pages at FDOH that contain the data updates.
    def walk_update_urls(url=nil)
      # Start on the known news URL page.
      # Or load a different page, as we page through everything.
      url ||= news_url

      # Fetch the URL.
      puts ' Update list page: '.
        colorize(color: :black, background: :light_blue) + ' ' +
        url.to_s
      html = open(url).read

      # Parse the HTML.
      doc = Nokogiri::HTML(html)

      # Pry.config.input = STDIN
      # Pry.config.output = STDOUT
      # binding.pry

      # Get a list of news items on the current page.
      news_items = []
      doc.css('.article_list li a').each do |news_item|
        next unless
          news_item.children.first.text =~ /Updates\ New\ COVID\-19\ Cases/i
        news_items << news_item.attr('href')
      end

      # Process each of those PDFs.
      news_items.each_with_index do |news_item, i|
        update_url = URI::join(news_url, news_item)
        puts ' Update page: '.
          colorize(color: :black, background: :light_blue) + ' ' +
          update_url.to_s

        process_data_pdf(
          update_url: update_url,
          data_url: find_data_url(update_url))

        puts ('-' * 70).light_white if i > 0
      end
    end

    # There is an HTML page for each update post from FDOH.
    # This method tries to locate the URL to the raw data PDF file in that page.
    def find_data_url(url)
      # Fetch the URL.
      html = open(url).read

      doc = Nokogiri::HTML(html)

      data_urls = doc.css('p').select{|p| p.to_s =~ /case\-by\-case\ basis/}
      unless data_urls.count.eql? 1
        puts ' COULD NOT FIND DATA URL '.
          colorize(color: :black, background: :red)
          return
      end

      data_url = data_urls.first.css('a').attr('href')
      # puts " Found data URL: #{data_url} ".light_blue
      data_url
    end

    def process_data_pdf(update_url:, data_url:)
      filename = URI(data_url).path.split(/\//).last
      puts ' Data file: '.
        colorize(color: :black, background: :light_blue) + ' ' +
        filename

      # For stopping at specific files when they're a problem.
      # return unless filename.eql? 'covid-19-data---daily-report-2020-03-22-0951.pdf'

      cache_filename = Cache.file(File.join('fdoh/pdf/' + filename)) do
        puts " Fetching from: #{cache_filename} ".
          colorize(color: :white, background: :blue)
        begin
          open(data_url).read
        rescue => error
          puts "ERROR: #{error.message}"
          return
        end
      end

      # process_daily_number_of_tests_data(
      #   filename: filename,
      #   cache_filename: cache_filename
      # )
      process_city_by_city_new_cases_data(
        filename: filename,
        cache_filename: cache_filename
      )
    end

    def process_daily_number_of_tests_data(filename:, cache_filename:)
      stop_phrase = "Number and percent of positive labs"
      extracted_text = Cache.load(File.join('fdoh/pdf/' + filename + '.txt')) do
        puts (' Exctracting number of people tested per day text from PDF... ').
          colorize(color: :white, background: :blue)
        reader = PDF::Reader.new(cache_filename)
        extracted_text = ''
        reader.pages.first(50).each do |page|
          extracted_text << page.text
          # We don't need anything below this string.
          break if page.text.include?(stop_phrase)
        end
      end

      # Now narrow it down farther.
      match = extracted_text.match(
        /Number of people tested per day(.*)(Percent positivity for new cases|Number and percent of positive labs)/m
      )
      extracted_text = match[1]

      # Narrow it even farther.
      match = extracted_text.match(
        /received\.\s*\n(\s+\d[^\(]*)\s+Date\(/m
      )
      extracted_text = match[1]

      # Trim off the last few lines.
      match = extracted_text.match(
        /^(.*\d)\n+$/m
      )
      extracted_text = match[1]

      puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)
      puts extracted_text.red
      puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)
    end

    def process_city_by_city_new_cases_data(filename:, cache_filename:)
      stop_phrase =
        'Statewide emergency department (ED)'

      extracted_text = Cache.load(File.join('fdoh/pdf/' + filename + '.txt')) do
        puts (' Exctracting city-by-city new cases text from PDF... ').
          colorize(color: :white, background: :blue)
        reader = PDF::Reader.new(cache_filename)
        extracted_text = ''
        reader.pages.first(50).each do |page|
          extracted_text << page.text
          # We don't need anything below this string.
          break if page.text.include?(stop_phrase)
        end
        extracted_text
      end

      # Extract the report date.
      date = extracted_text.string_between('Data verified as of', 'at')
      # For less-standard date headers in March 24 and older.
      date = extracted_text.string_between('Data as of', 'at') if date.nil?
      date = extracted_text.string_between('investigation, and cases',
        'at') if date.nil?
      date = extracted_text.string_between('830 cases', 'at') if date.nil?
      date.strip!
      puts ' Date: '.colorize(color: :black, background: :light_blue) +
        '          ' +
        date.colorize(color: :white, background: :green)

      # For skipping recent days and starting at a past date.
      return unless Chronic.parse(date).to_date >= Date.parse('2020-06-14')

      # Extract the count for Florida.
      florida_count = extracted_text.string_between(
        'Total cases','Florida residents').strip
      florida_count.gsub! /^\s*([\d\,]+)\s.*$/m, '\1'
      puts ' Florida cases: '.colorize(color: :black, background: :light_blue) + ' ' +
        florida_count.to_s.colorize(color: :white, background: :green)

      # Extract the number of cases per city.
      per_city_raw_text = extracted_text.string_between(
        'The table below includes the cities and counties of ' +
        'residence for cases in Florida residents',
        stop_phrase
      )
      # puts "EXTRACTED".colorize(color: :black, background: :yellow)
      # puts per_city_raw_text

      # Pull out the data with a regular expression.
      puts ' City data: '.colorize(color: :black, background: :light_blue)
      city_data = []
      unless per_city_raw_text.nil?
        per_city_raw_text.split("\n").each do |line|
          if line =~ /([^\,]+), ([^\d]+)\s+([\d\,]+)/
            city_data <<
              {
                city: $1.strip,
                county: $2.strip,
                count: $3.strip
              }
          end
        end
      end

      ap city_data.first(6).map{|city| [city[:city], city[:county], city[:count]] }

      GoogleSheets.new.write_city_data(
        spreadsheet_id: ENV['FDOH_BY_CITY_SPREADSHEET_ID'],
        date: Chronic.parse(date).to_date,
        city_data: city_data)

    end

  end
end

class String
  def string_between marker1, marker2
    # Split on the first marker.
    array_split_by_first_marker = self.split(marker1)

    # There might be more than one.  We want everything
    # between the first one and the second marker.
    # So, throw away the first string from before the first
    # marker and then take all of the rest as a string.
    array_split_by_first_marker.shift

    # Then split on the second marker and throw away anything
    # after it.
    array_split_by_first_marker.join.split(marker2).first
  end
end
