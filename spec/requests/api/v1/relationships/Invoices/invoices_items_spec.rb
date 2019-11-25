require 'rails_helper'

describe "When viewing the invoices's items endpoint" do
  it "I see the list of the items for that invoice" do
    plants_and_things = create(:merchant)
    tyla = create(:customer)
    invoice_1 = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")
    iris = Item.create(name: "Iris",
                       description: "Flowring Iris",
                       unit_price: 10,
                       merchant_id: plants_and_things.id)
    ivy = Item.create(name: "Ivy",
                      description: "Household Ivy",
                      unit_price: 8,
                      merchant_id: plants_and_things.id)
    lily = Item.create(name: "Lily",
                       description: "Flowering Lily",
                       unit_price: 12,
                       merchant_id: plants_and_things.id)
    invoice_item_1 = InvoiceItem.create(item_id: iris.id,
                                     invoice_id: invoice_1.id,
                                     quantity: 1,
                                     unit_price: 10)
    invoice_item_2 = InvoiceItem.create(item_id: ivy.id,
                                     invoice_id: invoice_1.id,
                                     quantity: 1,
                                     unit_price: 8)
    invoice_item_3 = InvoiceItem.create(item_id: lily.id,
                                     invoice_id: invoice_1.id,
                                     quantity: 1,
                                     unit_price: 12)

    get "/api/v1/invoices/#{invoice_1.id}/items"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response_body[:data][0][:attributes][:name]).to eq("Iris")
    expect(response_body[:data][1][:attributes][:merchant_id]).to eq(plants_and_things.id)
    expect(response_body[:data][2][:attributes][:description]).to eq("Flowering Lily")
  end
end
