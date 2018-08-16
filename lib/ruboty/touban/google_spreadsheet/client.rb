require 'google/api_client'

module Ruboty
  module Touban
    module GoogleSpreadsheet
      class Client
        SCOPE = 'https://www.googleapis.com/auth/drive'

        def initialize(client_id:, client_secret:, redirect_uri:, refresh_token:)
          @authorization = api_client.authorization
          @authorization.client_id = client_id
          @authorization.client_secret = client_secret
          @authorization.scope = SCOPE
          @authorization.redirect_uri = redirect_uri
          @refresh_token = refresh_token
        end

        def authorize!
          @authorization.refresh_token = @refresh_token
          @authorization.fetch_access_token!
          @refresh_token = @authorization.refresh_token
        end

        def access_token
          @authorization.access_token
        end

        private

        # FIXME: Migrate to GoogleDrive APIv3
        def api_client
          @api_client ||= Google::APIClient.new(
            application_name: 'ruboty-touban',
            application_version: Ruboty::Touban::VERSION
          )
        end
      end
    end
  end
end
