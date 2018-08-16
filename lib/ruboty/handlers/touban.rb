require 'ruboty/touban/actions/find'

module Ruboty
  module Handlers
    class Touban < Base
      env :TOUBAN_GOOGLE_CLIENT_ID, 'Google Client ID for Touban'
      env :TOUBAN_GOOGLE_CLIENT_SECRET, 'Google Client secret for Touban'
      env :TOUBAN_GOOGLE_REDIRECT_URI, 'Google Redirect URI for Touban'
      env :TOUBAN_GOOGLE_REFRESH_TOKEN, 'Google Refresh token issued with access token for Touban'
      env :TOUBAN_SPREADSHEET_KEY, 'Google Spreadsheet key for Touban (e.g. https://docs.google.com/spreadsheets/d/<key>/edit#gid=0)'

      on(
        /touban today/,
        name: 'today',
        description: "Who's on-duty today?"
      )

      on(
        /touban tomorrow/,
        name: 'tomorrow',
        description: "Who's on-duty tomorrow?"
      )

      def today(message)
        find_touban_on(message, Date.today)
      end

      def tomorrow(message)
        find_touban_on(message, Date.today + 1)
      end

      private

      def find_touban_on(message, target_date)
        Ruboty::Touban::Actions::Find.new(message).call(target_date.strftime('%Y/%m/%d'))
      end
    end
  end
end
