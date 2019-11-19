require 'csv'
  desc "import data"
  task import: :environment do
    merchant_csv = "sales_data/merchants.csv"
    csv_text = File.read(merchant_csv)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Merchant.create!(row.to_hash)
    end
  end
