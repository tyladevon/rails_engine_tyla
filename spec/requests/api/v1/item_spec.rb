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
    item = create(:item)

    get "/api/v1/items/find?name=#{item.name}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response_body[:data][:attributes][:name]).to eq(item.name)

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:name]).to eq(item.name)
  end

  it "can find by an attribute and return all for query" do
    create_time = ("2012-03-27 14:53:59 UTC")
    time_2 = ("2012-03-25 14:53:59 UTC")
    item_1 = create(:item, created_at: create_time)
    item_2 = create(:item, created_at: create_time)
    item_3 = create(:item, created_at: create_time)
    item_4 = create(:item, created_at: time_2)

    get "/api/v1/items/find_all?created_at=#{create_time}"

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(3)
  end

  it "can search random and get back a random item" do
    item = create(:item)

    get '/api/v1/items/random'
    expect(response).to be_successful
  end
end
