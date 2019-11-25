require 'rails_helper'

describe "When viewing the invoices's merchant's endpoint" do
  it "I see the list of the merchants for that invoice" do
    plants_and_things = create(:merchant)
    tyla = create(:customer)
    invoice_1 = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")

    get "/api/v1/invoices/#{invoice_1.id}/merchant"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:data][:attributes][:name]).to eq(plants_and_things.name)
  end
end
