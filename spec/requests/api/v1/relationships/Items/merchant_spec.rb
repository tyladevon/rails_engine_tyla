require 'rails_helper'

describe "When viewing an Item's merchant endpoint" do
  it "I see the merchant for that item" do
    plants_and_things = create(:merchant)

    lily = Item.create(name: "Lily",
                       description: "Flowering Lily",
                       unit_price: 12,
                       merchant_id: plants_and_things.id)

    get "/api/v1/items/#{lily.id}/merchant"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    expect(response_body[:data][:attributes][:name]).to eq(plants_and_things.name)
  end
end
