require 'rails_helper'

describe "Merchants API" do
  it 'sends a list of merchants' do
      create_list(:merchant, 3)

      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body)

      expect(merchants.count).to eq(3)
  end

  it "can get one merchant by its id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["data"]["id"]).to eq(id.to_s)
  end

  it "can find by attributes and return one item" do
    merchant = create(:merchant)
    
    get "/api/v1/merchants/find?name=#{merchant.name}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response_body[:data][:attributes][:name]).to eq(merchant.name)

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:name]).to eq(merchant.name)

  end

  it "can find by an attribute and return all for query" do
    create_time = ("2012-03-27 14:53:59 UTC")
    time_2 = ("2012-03-25 14:53:59 UTC")
    merchant_1 = create(:merchant, created_at: create_time)
    merchant_2 = create(:merchant, created_at: create_time)
    merchant_3 = create(:merchant, created_at: create_time)
    merchant_4 = create(:merchant, created_at: time_2)

    get "/api/v1/merchants/find_all?created_at=#{create_time}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(3)
  end

  it "can search random and get back a random merchant" do
    merchant = create(:merchant)

    get '/api/v1/merchants/random'
    expect(response).to be_successful

  end
end
