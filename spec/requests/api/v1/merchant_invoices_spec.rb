require 'rails_helper'

describe "When following merchant's items endpoint" do
  it "I see the list of the merchant's items" do
    plants_and_things = create(:merchant)
    luna = create(:customer)
    tyla = create(:customer)
    invoice_1 = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")
    invoice_2 = Invoice.create(customer_id: luna.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")

    get "/api/v1/merchants/#{plants_and_things.id}/invoices"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response_body[:data][0][:attributes][:customer_id]).to eq(tyla.id)
    expect(response_body[:data][1][:attributes][:customer_id]).to eq(luna.id)
  end
end
