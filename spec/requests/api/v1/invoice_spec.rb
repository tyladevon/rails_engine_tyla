require 'rails_helper'

describe "Invoices API" do
  it 'sends a list of invoices' do
      create_list(:invoice, 3)

      get '/api/v1/invoices'

      expect(response).to be_successful

      invoices = JSON.parse(response.body)

      expect(invoices.count).to eq(3)
  end

  it "can get one invoice by its id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["data"]["id"]).to eq(id.to_s)
  end

  it "can find by attributes and return one item" do
    invoice = create(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{invoice.merchant.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response_body[:data][:attributes][:merchant_id]).to eq(invoice.merchant.id)

    get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:merchant_id]).to eq(invoice.merchant.id)

  end

  it "can find by an attribute and return all for query" do
    create_time = ("2012-03-27 14:53:59 UTC")
    time_2 = ("2012-03-25 14:53:59 UTC")
    invoice_1 = create(:invoice, created_at: create_time)
    invoice_2 = create(:invoice, created_at: create_time)
    invoice_3 = create(:invoice, created_at: create_time)
    invoice_4 = create(:invoice, created_at: time_2)

    get "/api/v1/invoices/find_all?created_at=#{create_time}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body, symbolize_names: true)

    expect(invoices[:data].count).to eq(3)
  end

  it "can search random and get back a random invoice" do
    invoice = create(:invoice)

    get '/api/v1/invoices/random'
    expect(response).to be_successful

  end
end
