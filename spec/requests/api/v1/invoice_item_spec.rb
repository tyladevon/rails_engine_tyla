require 'rails_helper'

describe "invoice_items_Items API" do
  it 'sends a list of invoice_items' do
      create_list(:invoice_item, 3)

      get '/api/v1/invoice_items'

      expect(response).to be_successful

      invoice_item = JSON.parse(response.body)

      expect(invoice_item.count).to eq(3)
  end

  it "can get one invoice_item by its id" do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["id"]).to eq(id.to_s)
  end

  it "can find by attributes and return one item" do
    invoice_item = create(:invoice_item)
    get "/api/v1/invoice_items/find?item_id=#{invoice_item.item.id}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response_body[:data][:attributes][:item_id]).to eq(invoice_item.item.id)

    get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:item_id]).to eq(invoice_item.item.id)

  end

  it "can find by an attribute and return all for query" do
    create_time = ("2012-03-27 14:53:59 UTC")
    time_2 = ("2012-03-25 14:53:59 UTC")
    invoice_item_1 = create(:invoice_item, created_at: create_time)
    invoice_item_2 = create(:invoice_item, created_at: create_time)
    invoice_item_3 = create(:invoice_item, created_at: create_time)
    invoice_item_4 = create(:invoice_item, created_at: time_2)

    get "/api/v1/invoice_items/find_all?created_at=#{create_time}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body, symbolize_names: true)

    expect(invoice_items[:data].count).to eq(3)
  end

  it "can search random and get back a random invoice_item" do
    invoice_item = create(:invoice_item)

    get '/api/v1/invoice_items/random'
    expect(response).to be_successful

  end
end
