require 'scraper'

namespace 'scrape' do

  desc "Scrape Florida Department of Health updates"
  task :fdoh do
    Scraper::FDOH.new.update
  end

  desc "Scrape Florida Division of Emergency Management updates"
  task :fdem do
    Scraper::FDEM.new.update
  end

end
