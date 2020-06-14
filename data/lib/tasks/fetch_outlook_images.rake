require 'chart_images'

namespace 'charts' do

  desc "Fetch Outlook chart images from Google Sheets"
  task :fetch do
    Charts::Images.new.fetch
  end

end
