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
  @@column_names = {}

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

  def write_city_data(spreadsheet_id:, date:, city_data:)

    sheet_name = 'data'
    puts 'Sheet name:'.colorize(color: :black, background: :light_blue) + ' ' +
      sheet_name
    begin
      puts " Adding data sheet: #{sheet_name} ".
        colorize(color: :white, background: :blue)
      add_sheet(
        spreadsheet_id:spreadsheet_id,
        sheet_name: sheet_name,
        column_count: 1 )

      # Write the header.
      # write_values(
      #   spreadsheet_id: spreadsheet_id,
      #   range_name: "#{sheet_name}!A1:A1",
      #   values: [['Date']] )
    rescue Google::Apis::ClientError => e
      # Abort if the sheet already exists.
      throw e unless e.message =~ /A sheet with the name.*already exists/
      puts '[cached]'.green + ' sheet already exists -- skipping.'
    end

    find_or_create_column_for_header(
      spreadsheet_id: spreadsheet_id,
      header: 'date'
    )

    # Transform the city-by-city data hashes into whatever Google Sheets needs.
    # google_sheets_values = city_data.
    #   map{|city| [city[:city], city[:county], city[:count]]}

    # range_name = "#{sheet_name}!A2:C#{google_sheets_values.length+1}"

    date_row = find_or_create_row_for_date(
      spreadsheet_id: spreadsheet_id,
      date: date)

    city_data.
      sort_by{|city| [city[:county], city[:city]].join(', ')}.each do |city|
      city_column_name = find_or_create_column_for_header(
        spreadsheet_id: spreadsheet_id,
        header: [city[:city], city[:county]].join(', ')
      )

      cell_name = "#{city_column_name}#{date_row}"
      puts " Writing count: #{city[:count]} to cell #{cell_name} for #{city[:city]} ".
        colorize(color: :white, background: :blue)
      write_values(
        spreadsheet_id: spreadsheet_id,
        range_name: "data!#{cell_name}:#{cell_name}",
        values: [[city[:count]]] )
    end

    # * # * #
    #exit
  end

  def find_or_create_row_for_date(spreadsheet_id:, date:)
    result = @@service.get_spreadsheet_values(spreadsheet_id, 'data!A:A',
      value_render_option:'UNFORMATTED_VALUE')
    sleep 1 # API rate limiting
    unless result.values.nil?
      result.values.flatten.each_with_index do |value, i|
        # Return the range number for the row (not the index) if the date matches.

        next unless value.class.eql? Integer # Skip the header, not an integer.
        # The values for dates are integers representing the number of days
        # since December 30, 1899.
        if (Date.new(1899,12,30) + value).eql? date
          row = 1 + i
          puts '[exists]'.green + " row for #{date.to_s} already exists: #{row}"
          # Rows are indexed from 1, not 0-indexed.
          return row
        end
      end
    end

    # Create a new row and return the range number for the row.
    puts " Creating row for date: #{date.to_s} ".
      colorize(color: :white, background: :blue)
    response = @@service.append_spreadsheet_value(spreadsheet_id, 'data!A:A',
      {
        major_dimension: "COLUMNS",
        values: [
           [date.to_s]
         ]
      },
      value_input_option: 'USER_ENTERED')
    sleep 1 # API rate limiting

    # Example: "data!A3"
    response.updates.updated_range.match(/\w(\d+)$/)[1]
  end

  def find_or_create_column_for_header(spreadsheet_id:, header:)
    # Check the cache first for the column name.
    unless (column_name = @@column_names[header]).nil?
      return column_name
    end

    result = @@service.get_spreadsheet_values(spreadsheet_id, 'data!1:1',
      value_render_option:'UNFORMATTED_VALUE')
    sleep 1 # API rate limiting

    new_column_index = 1
    unless result.values.nil?
      result.values.flatten.each_with_index do |value, i|
        # Return the range letter for the column if the header matches.

        # The values for dates are integers representing the number of days
        # since December 30, 1899.
        if value.eql? header
          column_name = index_to_column_name(i + 1)
          puts '[exists]'.green +
            " column for #{header} already exists: #{column_name}"
          @@column_names[header] = column_name
          return column_name
        end

        new_column_index += 1
      end
    end

    # Create a new column and return the range letter for the row.
    new_column_name = index_to_column_name(new_column_index)
    puts " Creating column #{new_column_name} for header: #{header} ".
      colorize(color: :white, background: :blue)

    # Get the numeric sheet ID.
    # The Google Sheets API documentation is some kind of cruel practical joke.
    response = @@service.get_spreadsheet(spreadsheet_id)
    data_sheet = response.sheets.
      select{|sheet| sheet.properties.title.eql? 'data'}.first
    sheet_id = data_sheet.properties.sheet_id
    sleep 1 # API rate limiting

    # Insert a new column.
    if new_column_index >= data_sheet.properties.grid_properties.column_count
      puts " Inserting new column ".
        colorize(color: :white, background: :blue)

      request_obj = {
        requests: [
          {
            append_dimension: {
              sheet_id: sheet_id,
              dimension: 'columns',
              length: 1
            }
          }
        ]
      }
      result = @@service.batch_update_spreadsheet(spreadsheet_id,
        request_obj,
        {}
      )
      sleep 1 # API rate limiting
    end

    response = @@service.update_spreadsheet_value(spreadsheet_id,
      ["data!#{new_column_name}:#{new_column_name}"],
      Google::Apis::SheetsV4::ValueRange.new(values:[[header]]),
      value_input_option:'RAW'
    )
    sleep 1 # API rate limiting

    @@column_names[header] = new_column_name
    new_column_name
  end

  def index_to_column_name(integer)
    name = 'A'
    (integer - 1).times { name.succ! }
    name
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
    puts " #{result.updated_cells} cell#{'s' if result.updated_cells > 1} updated. ".
      colorize(color: :white, background: :green)
    sleep 2 # API rate limiting
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
    sleep 1 # API rate limiting

    # puts ">>>>>>>>>> response: #{response.inspect}"
  end
end
