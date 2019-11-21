require 'rails_helper'

describe "Item API" do
  it 'sends a list of items' do
      create_list(:item, 3)

      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body)

      expect(items.count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"]).to eq(id.to_s)
  end

  it "can find by attributes and return one item" do
    item_attributes = attributes_for(:item)
    item = create(:item, item_attributes)

    get "/api/v1/items/find?name=#{item.name}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response_body[:data][:attributes][:name]).to eq(item.name)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:name]).to eq(item.name)
  end

  it "can find by an attribute and return all for query" do
    item_attributes = attributes_for(:item)
    item = create(:item, item_attributes)

    get "/api/v1/items/find_all?name=#{item.merchant_id}"
    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    # binding.pry
    # expect(response_body[:data]).to eq([])
    # expect(response_body[:merchant_id]).to eq(item.merchant_id)

    get "/api/v1/items/find_all?created_at=#{item.created_at}"

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    # expect(response_body[:id]).to eq(item.id)
    # expect(response_body[:created_at]).to eq(item.created_at)
  end
end
