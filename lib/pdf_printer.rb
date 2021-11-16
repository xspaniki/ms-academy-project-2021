class PdfPrinter
  def self.print(template, variables={}, opts={})
    ac = ActionController::Base.new()

    variables.each{|key, value|
      ac.instance_eval("#{key} = nil")
      ac.instance_variable_set("@#{key}", value)
    }

    pdf = WickedPdf.new.pdf_from_string(ac.render_to_string(template, layout: 'pdf.html.haml', encoding: 'UTF-8'), opts)
  end
end
