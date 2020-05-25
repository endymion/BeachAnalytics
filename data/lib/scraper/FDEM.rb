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
# at: https://www.floridadisaster.org/news-media/news/

module Scraper
  class FDEM

    @@first_page_only = false

    def news_url
      'https://www.floridadisaster.org/news-media/news/'
    end

    # Update the Google Sheets spreadsheet that stores the raw data, from the
    # latest updates at the FDEM web site.
    def update
      puts (' Updating raw data from the ' +
        'Florida Department of Emergency Management ').
        colorize(color: :white, background: :blue)
      update_urls.each_with_index do |update_url, i|
        # No point going too far back.
        break if update_url.include?(
          '20200322-florida-department-of-health-updates-new-covid-19-cases-6-p.m')

        update_url = URI::join(news_url, update_url)
        puts ' Update page: '.
          colorize(color: :black, background: :light_blue) + ' ' +
          update_url.to_s

        process_data_pdf(
          update_url: update_url,
          data_url: find_data_url(update_url))

        puts ('-' * 70).light_white if i > 0

        sleep(2)
      end
    end

    # Get a list of URLs for the pages at FDEM that contain the data updates.
    def update_urls(url=nil)
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
      doc.css('#mainContent .thumb-list h4 a').each do |news_item|
        next unless
          news_item.attr('href') =~ /covid\-19.*update\b/i ||
           news_item.children.first.text =~ /COVID-19\s+\d+\/\d+\/\d+/i
        news_items << news_item.attr('href')
      end

      # If there is a next page then recurse into that page.
      unless(@@first_page_only ||
        (next_page_link = doc.css('li.pag-nav-next a')).empty?)

        sleep(2)

        news_items <<
          update_urls(URI::join(news_url, next_page_link.attr('href')))
      end

      news_items.flatten
    end

    # There is an HTML page for each update post from FDEM.
    # This method tries to locate the URL to the raw data PDF file in that page.
    def find_data_url(url)
      # Fetch the URL.
      html = open(url).read

      # I'm not parsing the HTML.  I'm just grabbing the PDF URL lexically.
      if html =~ /case\-by\-case basis.*href\=\"([^\"]+)\"/
        return $1
      else
        puts ' COULD NOT FIND DATA URL '.
          colorize(color: :black, background: :red)
      end
    end

    def process_data_pdf(update_url:, data_url:)
      filename = URI(data_url).path.split(/\//).last
      puts ' Data file: '.
        colorize(color: :black, background: :light_blue) + ' ' +
        filename

      # For stopping at specific files when they're a problem.
      # return unless filename.eql? 'covid-19-data---daily-report-2020-03-22-0951.pdf'

      cache_filename = Cache.file(File.join('fdem/pdf/' + filename)) do
        puts ' Fetching from: ' + filename.light_blue
        begin
          Net::HTTP.get(URI.parse(data_url))
        rescue => error
          puts "ERROR: #{error.message}"
          return
        end
      end

      ed_complaints =
        'Statewide emergency department (ED)'

      extracted_text = Cache.load(File.join('fdem/pdf/' + filename + '.txt')) do
        reader = PDF::Reader.new(cache_filename)
        extracted_text = ''
        reader.pages.first(50).each do |page|
          extracted_text << page.text
          # We don't need anything below this string.
          break if page.text.include?(ed_complaints)
        end
        extracted_text
      end

      puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)
      puts extracted_text[0..500].red
      puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)

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

      # Determine the update series ("morning" / "evening") from the URL.
      series_name = discern_series_name(update_url.to_s)
      puts ' Series: '.colorize(color: :black, background: :light_blue) +
        '        ' +
        series_name.colorize(color: :white, background: :green)

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
        ed_complaints
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
        spreadsheet_id: ENV['FDEM_BY_CITY_SPREADSHEET_ID'],
        date: Chronic.parse(date),
        series_name: series_name,
        city_data: city_data)

    end

    def discern_series_name(string)
      # puts "DISCERN SERIES NAME: " + string.
      #   colorize(color: :black, background: :white)
      return 'morning' if string =~ /morning\-update/
      return 'morning' if string =~ /11\-a.m/
      return 'evening' if string =~ /evening\-update/
      return 'evening' if string =~ /6\-p.m/
      'evening'
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
