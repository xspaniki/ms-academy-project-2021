require 'pdf_printer'

module Printers
  class UsersPrinter
    def self.process(variables={})
      PdfPrinter.print('users/print.html.haml', variables)
    end
  end
end
