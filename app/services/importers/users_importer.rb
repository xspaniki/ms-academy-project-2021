require 'roo'

module Importers
  class UsersImporter
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def process
      begin
        xls = Roo::Spreadsheet.open(file_path, extension: :xlsx)
        sheet = xls.sheet(0)

        (2..sheet.last_row).each do |value|
          data = sheet.row(value)

          password = SecureRandom.hex(8)

          attrs = {
            first_name: data[0],
            last_name: data[1],
            sex: data[3],
            organization_id: data[4],
            password: password,
            password_confirmation: password
          }

          # TODO send email with password

          user = User.find_or_initialize_by(email: data[2])
          user.assign_attributes(attrs)
          user.save
        end

        true
      rescue
        false
      end
    end
  end
end
