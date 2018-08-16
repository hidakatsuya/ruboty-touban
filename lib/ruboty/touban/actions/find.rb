require 'ruboty/touban/google_spreadsheet/spreadsheet'
require 'date'

module Ruboty
  module Touban
    module Actions
      class Find < Ruboty::Actions::Base
        def call(target_date)
          touban = find_touban_on(target_date)

          if touban
            message.reply(touban.join(' '))
          else
            message.reply('Not Found')
          end
        end

        private

        def find_touban_on(date)
          spreadsheet.worksheet.rows.find { |row| row.include?(date) }
        end

        def spreadsheet
          @spreadsheet ||= Touban::GoogleSpreadsheet::Spreadsheet.new
        end
      end
    end
  end
end
