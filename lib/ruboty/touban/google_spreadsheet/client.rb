module Ruboty
  module Touban
    module GoogleSpreadsheet
      class Client
        SCOPE = %w(
          https://www.googleapis.com/auth/drive
          https://spreadsheets.google.com/feeds/
        ).freeze

        def initialize(client_id:, client_secret:, redirect_uri:, refresh_token:)
          @credentials = Google::Auth::UserRefreshCredentials.new(
            client_id: client_id,
            client_secret: client_secret,
            scope: SCOPE,
            redirect_uri: redirect_uri
          )
          @refresh_token = refresh_token
        end

        def authorize!
          @credentials.refresh_token = @refresh_token
          @credentials.fetch_access_token!

          GoogleDrive::Session.from_credentials(@credentials)
        end
      end
    end
  end
end
