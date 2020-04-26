require 'jekyll/scholar'
# Contributed by @mfenner as markdown_links.rb
# See https://github.com/inukshuk/jekyll-scholar/issues/30
# modified to generate html instead of markdown by @rawlins

require 'uri'

module Jekyll
  class Scholar
    class HtmlLinks < BibTeX::Filter
      URL_PATTERN = URI.regexp(['http', 'https', 'ftp'])
      def apply(value)
        value.to_s.gsub(URL_PATTERN) {
          "<a href=\"#{$&}\">link</a>"
        }
      end
    end
  end
end
