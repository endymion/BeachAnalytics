require 'scraper'

namespace 'scrape' do

  desc "Scrape Florida Department of Emergency Management updates"
  task :fdem do
    Scraper::FDEM.new.update
  end

end
