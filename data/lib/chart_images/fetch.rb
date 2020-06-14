require 'fileutils'
require 'open-uri'

module Charts
  class Images

    @@chart_images = [
      # Charts for the side bar.
      # These have large fonts because they're designed to be published at a
      # small size on a web page.
      {
        type: 'daily-new-confirmed-covid19-cases',
        area: 'miami-metropolitan-area',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=832042469&format=image'
      },
      {
        type: 'daily-new-confirmed-covid19-cases',
        area: 'miami-and-miami-beach',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=1186020218&format=image'
      },
      {
        type: 'daily-new-confirmed-covid19-cases',
        area: 'miami-metropolitan-area-vs-rest-of-florida',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=460911684&format=image'
      },
      {
        type: 'daily-new-confirmed-covid19-cases',
        area: 'rest-of-florida',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=1666907523&format=image'
      },

      # Full-sized charts (smaller fonts) for the South Florida Outlook.
      # These are designed to be published at a larger size.
      {
        type: 'daily-new-confirmed-covid19-cases-outlook',
        area: 'miami-metropolitan-area',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=1624042143&format=image'
      },
      {
        type: 'daily-new-confirmed-covid19-cases-outlook',
        area: 'miami-and-miami-beach',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=375608151&format=image'
      },
      {
        type: 'daily-new-confirmed-covid19-cases-outlook',
        area: 'rest-of-florida',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=1578342545&format=image'
      },
      {
        type: 'daily-new-confirmed-covid19-cases-outlook',
        area: 'miami-metropolitan-area-vs-rest-of-florida',
        url: 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQwUar9_gBJLUXC9WrrwcF6gFXvLqqhoRjh2sPTo43Dvh8nCjX-ip7gZeDFCqseZ9dLXpVNi1pqz3OZ/pubchart?oid=2096722478&format=image'
      }
    ]

    def fetch
      puts (' Fetching chart images from Google Sheets ').
        colorize(color: :white, background: :blue)

      @@chart_images.each do |chart|
        filename = Date.today.strftime('%Y-%m-%d') + '.png'
        folder = "../site/charts/#{chart[:type]}/#{chart[:area]}"
        file_path = File.join([folder,filename])

        puts ' type: '.
          colorize(color: :black, background: :light_blue) + ' ' +
          chart[:type]
        puts ' area: '.
          colorize(color: :black, background: :light_blue) + ' ' +
          chart[:area]
        puts ' file: '.
          colorize(color: :black, background: :light_blue) + ' ' +
          file_path
        puts ' url:  '.
          colorize(color: :black, background: :light_blue) + ' ' +
          chart[:url]

        print 'fetching...'
        FileUtils.mkdir_p folder
        open(file_path, 'wb') do |file|
          file.print open(chart[:url], &:read)
        end
        puts ' done '.colorize(color: :white, background: :green)
      end
    end

  end
end
