require 'dotenv/load'
require "google/apis/sheets_v4"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "BeachCoV2 Transformer".freeze
CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS

class GoogleSheets
  @@service

  def initialize
    # Initialize the API
    @@service = Google::Apis::SheetsV4::SheetsService.new
    @@service.client_options.application_name = APPLICATION_NAME
    @@service.authorization = authorize
  end

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
  def authorize
    client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    user_id = "default"
    credentials = authorizer.get_credentials user_id
    if credentials.nil?
      url = authorizer.get_authorization_url base_url: OOB_URI
      puts "Open the following URL in the browser and enter the " \
           "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
        user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end

  def write_city_data(spreadsheet_id:, date:, series_name:, city_data:)

    sheet_name = date.strftime('%y-%m-%d-') + series_name
    puts 'Sheet name:'.colorize(color: :black, background: :light_blue) + ' ' +
      sheet_name
    begin
      add_sheet(
        spreadsheet_id:spreadsheet_id,
        sheet_name: sheet_name,
        column_count: 3 )
    rescue Google::Apis::ClientError => e
      # Abort if the sheet already exists.
      throw e unless e.message =~ /A sheet with the name.*already exists/
      puts '[cached]'.green + ' sheet already exists -- skipping.'
      return
    end

    # Write the header.
    write_values(
      spreadsheet_id: spreadsheet_id,
      range_name: "#{sheet_name}!A1:C1",
      values: [['City', 'County', 'Case Count']] )

    # Transform the city-by-city data hashes into whatever Google Sheets needs.
    google_sheets_values = city_data.
      map{|city| [city[:city], city[:county], city[:count]]}

    range_name = "#{sheet_name}!A2:C#{google_sheets_values.length+1}"

    write_values(
      spreadsheet_id: spreadsheet_id,
      range_name: range_name,
      values: google_sheets_values )
  end

  def write_values(spreadsheet_id:, range_name:, values:)
    value_input_option = 'USER_ENTERED'
    value_range_object =
      Google::Apis::SheetsV4::ValueRange.new(
        range:  range_name,
        values: values)
    result = @@service.update_spreadsheet_value(
      spreadsheet_id,
      range_name,
      value_range_object,
      value_input_option: value_input_option)
    puts " #{result.updated_cells} cells updated. ".
      colorize(color: :white, background: :green)
  end

  def add_sheet(spreadsheet_id:nil, sheet_name:nil, column_count:10)
    add_sheet_request = Google::Apis::SheetsV4::AddSheetRequest.new
    add_sheet_request.properties = Google::Apis::SheetsV4::SheetProperties.new
    add_sheet_request.properties.title = sheet_name

    grid_properties = Google::Apis::SheetsV4::GridProperties.new
    grid_properties.column_count = column_count
    add_sheet_request.properties.grid_properties = grid_properties

    batch_update_spreadsheet_request = Google::Apis::SheetsV4::BatchUpdateSpreadsheetRequest.new
    batch_update_spreadsheet_request.requests = Google::Apis::SheetsV4::Request.new

    batch_update_spreadsheet_request_object = [ add_sheet: add_sheet_request ]
    batch_update_spreadsheet_request.requests = batch_update_spreadsheet_request_object
    response = @@service.batch_update_spreadsheet(spreadsheet_id,
         batch_update_spreadsheet_request)

    # puts ">>>>>>>>>> response: #{response.inspect}"
  end
end
