require 'rails_helper'

describe "When viewing the Invoices-Items's invoice endpoint" do
  it "I see the invoice for that invoice-item" do
    plants_and_things = create(:merchant)
    tyla = create(:customer)
    invoice = Invoice.create(customer_id: tyla.id,
                               merchant_id: plants_and_things.id,
                               status: "shipped")
    iris = Item.create(name: "Iris",
                       description: "Flowring Iris",
                       unit_price: 10,
                       merchant_id: plants_and_things.id)

    invoice_item = InvoiceItem.create(item_id: iris.id,
                                    invoice_id: invoice.id,
                                    quantity: 1,
                                    unit_price: 10)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:data][:attributes][:customer_id]).to eq(tyla.id)
    expect(response_body[:data][:attributes][:merchant_id]).to eq(plants_and_things.id)
  end
end
