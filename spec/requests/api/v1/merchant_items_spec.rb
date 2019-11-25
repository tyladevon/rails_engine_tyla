require 'rails_helper'

describe "When following merchant's items endpoint" do
  it "I see the list of the merchant's items" do
    plants_and_things = create(:merchant)
    iris = Item.create(name: "Iris",
                                 description: "Flowring Iris",
                                 unit_price: 10,
                                 merchant_id: plants_and_things.id)
    ivy = Item.create(name: "Ivy",
                                 description: "Household Ivy",
                                 unit_price: 8,
                                 merchant_id: plants_and_things.id)
    lily = Item.create(name: "Lily",
                                 description: "Flowring Lily",
                                 unit_price: 12,
                                 merchant_id: plants_and_things.id)

    get "/api/v1/merchants/#{plants_and_things.id}/items"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)
    
    expect(response_body[:data][0][:attributes][:name]).to eq(iris.name)
    expect(response_body[:data][1][:attributes][:name]).to eq(ivy.name)
    expect(response_body[:data][2][:attributes][:name]).to eq(lily.name)
  end
end
