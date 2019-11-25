require 'rails_helper'

describe "When viewing the invoices's customers endpoint" do
  it "I see the list of the customers for that invoice" do
    plants_and_things = create(:merchant)
    tyla = create(:customer)
    invoice_1 = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")

    get "/api/v1/invoices/#{invoice_1.id}/customer"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response_body[:data][:attributes][:first_name]).to eq(tyla.first_name)
    expect(response_body[:data][:attributes][:last_name]).to eq(tyla.last_name)
  end
end
