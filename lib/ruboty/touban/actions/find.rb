require 'ruboty/touban/google_spreadsheet/spreadsheet'
require 'date'

module Ruboty
  module Touban
    module Actions
      class Find < Ruboty::Actions::Base
        def call(target_date)
          row = find_row_by(target_date)

          if row
            message.reply(row.join(' '))
          else
            message.reply('Not Found')
          end
        end

        private

        def find_row_by(date)
          spreadsheet.worksheet.rows.find { |row| row.include?(date) }
        end

        def spreadsheet
          @spreadsheet ||= Touban::GoogleSpreadsheet::Spreadsheet.new
        end
      end
    end
  end
end
