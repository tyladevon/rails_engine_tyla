require 'csv'
  desc "import data"
  task import: :environment do
      ['merchants','items','customers','invoices','invoice_items','transactions'].each do |file|
        sales_csv = File.read("sales_data/#{file}.csv")
        csv = CSV.parse(sales_csv, :headers => true)
        model = file.camelize.singularize.constantize
        csv.each do |row|
          model.create!(row.to_hash)
        end
      end
  end
