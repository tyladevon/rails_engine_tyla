require 'rails_helper'

describe "When viewing the invoices's transactions endpoint" do
  it "I see the list of the transactions for that invoice" do
    plants_and_things = create(:merchant)
    tyla = create(:customer)
    invoice_1 = Invoice.create(customer_id: tyla.id,
                                 merchant_id: plants_and_things.id,
                                 status: "shipped")
    transaction_1 = Transaction.create(invoice_id: invoice_1.id,
                                       credit_card_number: 4654405418249645,
                                       credit_card_expiration_date: "",
                                       result: "success")
    transaction_1 = Transaction.create(invoice_id: invoice_1.id,
                                       credit_card_number: 4654405418249687,
                                       credit_card_expiration_date: "",
                                       result: "success")

    get "/api/v1/invoices/#{invoice_1.id}/transactions"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:data][0][:attributes][:invoice_id]).to eq(invoice_1.id)
    expect(response_body[:data][1][:attributes][:invoice_id]).to eq(invoice_1.id)
  end
end
