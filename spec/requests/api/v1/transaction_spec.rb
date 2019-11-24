require 'rails_helper'

describe "transactions API" do
  it 'sends a list of transactions' do
      create_list(:transaction, 3)

      get '/api/v1/transactions'

      expect(response).to be_successful

      transactions = JSON.parse(response.body, symbolize_names: true)

      expect(transactions[:data].count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["data"]["id"]).to eq(id.to_s)
  end

  it "can find by attributes and return one item" do
    transaction = create(:transaction)

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    # binding.pry
    expect(response_body[:data][:attributes][:invoice_id]).to eq(transaction.invoice_id)

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:invoice_id]).to eq(transaction.invoice_id)

  end

  it "can find by an attribute and return all for query" do
    create_time = ("2012-03-27 14:53:59 UTC")
    time_2 = ("2012-03-25 14:53:59 UTC")
    transaction_1 = create(:transaction, created_at: create_time)
    transaction_2 = create(:transaction, created_at: create_time)
    transaction_3 = create(:transaction, created_at: create_time)
    transaction_4 = create(:transaction, created_at: time_2)

    get "/api/v1/transactions/find_all?created_at=#{create_time}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body, symbolize_names: true)

    expect(transactions[:data].count).to eq(3)
  end

  it "can search random and get back a random transaction" do
    transaction = create(:transaction)

    get '/api/v1/transactions/random'
    expect(response).to be_successful

  end
end
