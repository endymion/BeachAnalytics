require_relative '../scraper'
require 'pry'
require 'awesome_print'
require 'colorize'
require 'uri'
require 'open-uri'
require 'nokogiri'
require 'chronic'
require 'fileutils'

##########
# A web scraper for automatically fetching data from the
# Florida Department of Emergency Management
# at: http://www.floridahealth.gov

module Scraper

  class FDOH

    @@first_page_only = false

    @@dates_processed_already = {}

    # Set to dates like '2020-06-21' to process archives.
    @@process_archives_on_or_before = '2020-06-24'
    @@process_archives_on_or_after = nil

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
      # Look at the PDF on the main 'today' URL, rather than the archivews.
      unless(@@process_archives_on_or_before || @@process_archives_on_or_after)
        current_report_url =
          'http://ww11.doh.state.fl.us/comm/_partners/action/' +
            'report_archive/state/state_reports_latest.pdf'

        puts ' Checking current report PDF URL: '.
          colorize(color: :black, background: :light_blue) + ' ' +
          current_report_url.to_s

        process_data_pdf(
          update_url: nil, # Don't cache it.
          data_url: current_report_url)

        return
      end

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
      # Fetch the URL if necessary and cache it.
      cache_key = url.path.gsub(/\//,'_').gsub(/^\_newsroom\_/,'')
      html = Cache.load(File.join(['fdoh/update_html', cache_key])) do
        puts " Fetching: ".colorize(color: :white, background: :blue) +
          ' ' + cache_key
        puts " From: ".colorize(color: :white, background: :blue) +
          ' ' + url.to_s
        begin
          open(url).read
        rescue => error
          puts "ERROR: #{error.message}"
          return
        end
      end

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
      filename =
        if update_url
          URI(data_url).path.split(/\//).last
        else
          # Don't cache the file if there is no update URL.
          # (For checking the 'current' URL.  It doesn't change from day to day.)
          cache_key_for_current_pdf = 'current'
          cache_file =
            Cache.cache_filename(cache_key(filename: cache_key_for_current_pdf))
          extracted_text_file = cache_file + '.txt'
          File.delete cache_file if File.exist?(cache_file)
          File.delete extracted_text_file if File.exist?(extracted_text_file)
          cache_key_for_current_pdf
        end

      puts ' Data file: '.
        colorize(color: :black, background: :light_blue) + ' ' +
        filename

      Cache.file(File.join(['fdoh/pdf', filename])) do
        puts " Fetching: ".colorize(color: :white, background: :blue) +
          ' ' + filename
        puts " From: ".colorize(color: :white, background: :blue) +
          ' ' + data_url
        begin
          open(data_url).read
        rescue => error
          puts "ERROR: #{error.message}"
          return
        end
      end

      extract_deaths_lines(filename: filename)
      # process_daily_number_of_tests_data(filename: filename)
      # process_city_by_city_new_cases_data(filename: filename)
    end

    def extract_deaths_lines(filename:)
      stop_phrase =
        'Coronavirus: testing by laboratory'

      extracted_text = extract_text_from_pdf(filename: filename)

      date_text = extract_date_from_pdf_text(text: extracted_text)
      date = Chronic.parse(date_text).to_date

      if @@process_archives_on_or_before
        # This one only works in archive mode.
        unless date <= Date.parse(@@process_archives_on_or_before)
          puts '[skipping] '.green +
            "date isn't before #{@@process_archives_on_or_after}.".gray
          return
        end
      end

      # Narrow in on the line list of deaths.
      parts = extracted_text.split(
        /Coronavirus\: line list of deaths/,
      )
      parts.shift # Discard everything before the first instance of that header.
      deaths_extracted_text = parts.flatten.join("\n")

      # Trim off the line list of cases.
      parts = deaths_extracted_text.split(
        /Coronavirus\: line list of cases/,
      )
      deaths_extracted_text = parts.shift # Keep everything before that.

      # puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)
      # puts extracted_text.red
      # puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)

      # Pull out the data with a regular expression.
      death_lines =
        "County, Age, Gender, Travel related, Travel detail and contact with a convirmed case, Jurisdiction, Date case counted\n"
      deaths_extracted_text.split("\n").each do |line|
        puts line
        if match = line.match(/^[\d\,]+\s+(\w+)\s+(\d+)\s+(\w+)\s+(\w+)\s+(.*)\s+(FL resident)\s+([\d\/]+)\s*(\w*)$/)
          this_line = [
              match[1].strip,
              match[2].strip,
              match[3].strip,
              match[4].strip,
              match[5].strip.gsub(/\s+/,' '),
              match[6].strip,
              match[7].strip
            ].join(', ')
          puts "match: #{this_line}"
          death_lines << this_line + "\n"
        else
          puts "No match: #{line}"
        end
      end

      puts '--- DEATHS TEXT ---'.colorize(color: :black, background: :red)
      puts death_lines.red
      puts '--- DEATHS TEXT ---'.colorize(color: :black, background: :red)

      directory = "/Users/work/projects/line-lists--florida-department-of-health/#{date.to_s}"
      Dir.mkdir(directory) unless Dir.exist?(directory)
      File.open(
        File.join(directory, 'line-list-of-deaths.txt'),
        'w') { |file| file.write(death_lines) }

      #####

      # Narrow in on the line list of deaths.
      parts = extracted_text.split(
        /Coronavirus\: line list of cases/,
      )
      parts.shift # Discard everything before the first instance of that header.
      cases_extracted_text = parts.flatten.join("\n")

      # puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)
      # puts extracted_text.red
      # puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)

      # Pull out the data with a regular expression.
      cases_lines =
        "County, Age, Gender, Travel related, Travel detail and contact with a convirmed case, Jurisdiction, Date case counted\n"
      cases_extracted_text.split("\n").each do |line|
        puts line
        if match = line.match(/^[\d\,]+\s+(\w+)\s+(\d+)\s+(\w+)\s+(\w+)\s+(.*)\s+(FL resident)\s+([\d\/]+)\s*(\w*)$/)
          this_line = [
              match[1].strip,
              match[2].strip,
              match[3].strip,
              match[4].strip,
              match[5].strip.gsub(/\s+/,' '),
              match[6].strip,
              match[7].strip
            ].join(', ')
          puts "match: #{this_line}"
          cases_lines << this_line + "\n"
        else
          puts "No match: #{line}"
        end
      end

      puts '--- CASES TEXT ---'.colorize(color: :black, background: :red)
      puts cases_lines.red
      puts '--- CASES TEXT ---'.colorize(color: :black, background: :red)

      directory = "/Users/work/projects/line-lists--florida-department-of-health/#{date.to_s}"
      Dir.mkdir(directory) unless Dir.exist?(directory)
      File.open(
        File.join(directory, 'line-list-of-cases.txt'),
        'w') { |file| file.write(cases_lines) }

    end

    def process_daily_number_of_tests_data(filename:)
      stop_phrase =
        'Coronavirus: testing by laboratory'

      extracted_text = extract_text_from_pdf(filename: filename)

      date_text = extract_date_from_pdf_text(text: extracted_text)
      date = Chronic.parse(date_text).to_date

      # For skipping recent days and starting at a past date.
      if @@process_archives_on_or_after
        unless date >= Date.parse(@@process_archives_on_or_after)
          puts '[skipping] '.green +
            "date is before #{@@process_archives_on_or_after}.".gray
          return
        end
      elsif @@process_archives_on_or_before
        unless date <= Date.parse(@@process_archives_on_or_before)
          puts '[skipping] '.green +
            "date is before #{@@process_archives_on_or_after}.".gray
          return
        end
      else
        unless date.eql? Date.today
          puts '[skipping] '.green +
            "date is not today.".gray
          return
        end
      end

      # Only process the latest report from each date.
      if @@dates_processed_already[:testing].nil?
        @@dates_processed_already[:testing] = {}
      end
      if @@dates_processed_already[:testing][date]
        puts '[skipping] '.green +
          "later report for #{date_text} already processed".gray
        return
      end
      @@dates_processed_already[:testing][date] = true

      # Extract the number of cases per city.
      extracted_text = extracted_text.string_between(
        'Coronavirus: All persons with tests reported',
        stop_phrase
      )

      puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)
      puts extracted_text.red
      puts '--- EXTRACTED TEXT ---'.colorize(color: :black, background: :red)

      # Pull out the data with a regular expression.
      testing_data = []
      unless extracted_text.nil?
        extracted_text.split("\n").each do |line|
          # if line =~ /([\D\s\.]+\b)[\s\d]+([\d\,]+)\s+([\d\,]+)\s+([\d\,]+\$)\s+([\d\,]+)/
          if line =~ /^([\D\s\.]+\b)[\s\d\,]+[\d\,]+\s+([\d\,]+)\s+([\d\,]+\%)\s+([\d\,]+)/
            testing_data <<
              {
                county: $1.strip,
                positive: $2.strip,
                percent_positive: $3.strip,
                total_tested: $4.strip
              }
          end
        end
      end

      puts ' Testing data: '.colorize(color: :black, background: :light_blue)
      ap testing_data

      GoogleSheets.new.write_county_data(
        spreadsheet_id: ENV['FDOH_TESTING_DATA_SPREADSHEET_ID'],
        date: date,
        testing_data: testing_data)
    end

    def process_city_by_city_new_cases_data(filename:)
      stop_phrase =
        'Statewide emergency department (ED)'

      extracted_text = extract_text_from_pdf(filename: filename)

      date = extract_date_from_pdf_text(text: extracted_text)

      # For skipping recent days and starting at a past date.
      return unless Chronic.parse(date).to_date >= Date.parse('2020-06-19')

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
        date: date,
        city_data: city_data)

    end

    def extract_text_from_pdf(filename:)
      txt_cache_filename = cache_key(filename: filename) + '.txt'

      puts ' Extracted text file: '.
        colorize(color: :black, background: :light_blue) + ' ' +
        txt_cache_filename

      Cache.generate(txt_cache_filename) do
        puts (' Exctracting text from PDF... ').
          colorize(color: :white, background: :blue)
        command = 'pdftotext -layout ' +
          Cache.cache_filename(cache_key(filename: filename))
        puts (' command: ').
          colorize(color: :white, background: :blue) + ' ' + command
        system(command)
      end

      # Returns a string, not a filename.
      File.read(Cache.cache_filename(txt_cache_filename))
    end

    def extract_date_from_pdf_text(text:)
      # Extract the report date.
      date = text.string_between('verified as of', 'at')
      # For less-standard date headers in March 24 and older.
      date = text.string_between('Data as of', 'at') if date.nil?
      date = text.string_between('investigation, and cases',
        'at') if date.nil?
      date = text.string_between('830 cases', 'at') if date.nil?
      date.strip!

      puts ' Date: '.colorize(color: :black, background: :light_blue) +
        '          ' +
        date.colorize(color: :white, background: :green)

      date
    end

    def cache_key(filename:)
      File.join(['fdoh/pdf', filename])
    end

  end

  class BoundingBoxHTMLParser < Nokogiri::XML::SAX::Document
    def start_element(name, attrs = [])
      puts "name".colorize(color: :white, background: :blue) + name
      puts "attrs".colorize(color: :white, background: :blue)
      ap name
    end

    def characters(string)
      # Any characters between the start and end element expected as a string
    end

    def end_element(name)
      # Given the name of an element once its closing tag is reached
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
