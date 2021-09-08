require 'google_drive'
require 'ruboty/touban/google_spreadsheet/client'

module Ruboty
  module Touban
    module GoogleSpreadsheet
      class Spreadsheet
        attr_reader :client

        def initialize
          @client = Ruboty::Touban::GoogleSpreadsheet::Client.new(
            client_id: ENV['TOUBAN_GOOGLE_CLIENT_ID'],
            client_secret: ENV['TOUBAN_GOOGLE_CLIENT_SECRET'],
            redirect_uri: ENV['TOUBAN_GOOGLE_REDIRECT_URI'],
            refresh_token: ENV['TOUBAN_GOOGLE_REFRESH_TOKEN']
          )
        end

        def worksheet
          spreadsheet.worksheets[0]
        end

        private

        def spreadsheet
          @spreadsheet ||= session.spreadsheet_by_key(ENV['TOUBAN_SPREADSHEET_KEY'])
        end

        def session
          @session ||= @client.authorize!
        end
      end
    end
  end
end
