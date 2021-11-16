require 'rubygems'
require 'write_xlsx'

module Exporters
  class UsersExporter
    DEFAULT_SHEET_NAME = 'Sheet'
    DEFAULT_ORIGINAL_FILE_NAME = 'excel.xlsx'
    COLUMNS = ['first_name', 'last_name', 'email', 'sex', 'organization_id']

    def self.process
      file = prepare_temp_file_path
      workbook = WriteXLSX.new(file)
      worksheet = workbook.add_worksheet(DEFAULT_SHEET_NAME)

      COLUMNS.each_with_index do |column_name, column_index|
        worksheet.write(0, column_index, column_name)
      end

      row_index = 1
      prepare_users.each do |user|
        COLUMNS.each_with_index do |column_name, column_index|
          worksheet.write(row_index, column_index, user.send(column_name))
        end

        row_index += 1
      end

      workbook.close

      file
    end

    private

    def self.prepare_users
      User.all
    end

    def self.prepare_temp_file_path
      out = Tempfile.new(DEFAULT_ORIGINAL_FILE_NAME)
      out.path
    end
  end
end
