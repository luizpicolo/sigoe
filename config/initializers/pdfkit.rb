# frozen_string_literal: true

require 'pdfkit'

Rails.env.on(:any) do
  config.middleware.use PDFKit::Middleware, print_media_type: true
end
