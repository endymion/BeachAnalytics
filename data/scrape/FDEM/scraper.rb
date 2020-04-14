require 'nokogiri'
require 'uri'
require 'chronic'

##########
# A web scraper for automatically fetching data from the
# Florida Department of Emergency Management
# at: https://www.floridadisaster.org/news-media/news/

module FDEM
  class Scraper

    def updates_URL
      'https://www.floridadisaster.org/news-media/news/'
    end

    def updates
      doc = Nokogiri::HTML(updates_URL)

      puts "Updates page:"
      puts doc.inspect

      # events = []
      # doc.css('#MyPostedRacesGrid tr').each do |event_row|
      #   next if event_row.css('td').count.zero? # The <th> row.
      #
      #   events << Webscorer::Event.new(
      #     title: event_row.css('td:nth-child(2) a').text.strip,
      #     date: Chronic.parse(event_row.css('td:nth-child(3) span').text.strip),
      #     url: URI::join(
      #       'https://www.webscorer.com',
      #       event_row.css('td:nth-child(2) a')[0]['href'].strip),
      #     result_type: event_row.css('td:nth-child(2) span.racetype').text.strip)
      # end

      events
    end
  end
end
