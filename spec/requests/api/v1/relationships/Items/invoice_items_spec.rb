require 'rails_helper'

describe "When viewing an Item's invoice-items endpoint" do
  it "I see the list of the invoice-items for that item" do
    plants_and_things = create(:merchant)
    tyla = create(:customer)
    invoice = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")
    invoice_2 = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")
    iris = Item.create(name: "Iris",
                       description: "Flowring Iris",
                       unit_price: 10,
                       merchant_id: plants_and_things.id)
    invoice_item = InvoiceItem.create(item_id: iris.id,
                                      invoice_id: invoice.id,
                                      quantity: 3,
                                      unit_price: 10)
    invoice_item_2 = InvoiceItem.create(item_id: iris.id,
                                      invoice_id: invoice_2.id,
                                      quantity: 5,
                                      unit_price: 10)

    get "/api/v1/items/#{iris.id}/invoice_items"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:data][0][:attributes][:item_id]).to eq(iris.id)
    expect(response_body[:data][1][:attributes][:invoice_id]).to eq(invoice_2.id)
  end
end
