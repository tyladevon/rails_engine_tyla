require 'rails_helper'

describe "customers API" do
  it 'sends a list of customers' do
      create_list(:customer, 3)

      get '/api/v1/customers'

      expect(response).to be_successful

      customers = JSON.parse(response.body)

      expect(customers.count).to eq(3)
  end

  it "can get one customer by its id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["data"]["id"]).to eq(id.to_s)
  end

  it "can find by attributes and return one item" do
    customer_attributes = attributes_for(:customer)
    customer = create(:customer, customer_attributes)

    get "/api/v1/customers/find?first_name=#{customer.first_name}"

    response_body = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response_body[:data][:attributes][:first_name]).to eq(customer.first_name)

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    expect(response).to be_successful
    expect(response_body[:data][:attributes][:first_name]).to eq(customer.first_name)

  end

  it "can find by an attribute and return all for query" do
    create_time = ("2012-03-27 14:53:59 UTC")
    time_2 = ("2012-03-25 14:53:59 UTC")
    customer_1 = create(:customer, created_at: create_time)
    customer_2 = create(:customer, created_at: create_time)
    customer_3 = create(:customer, created_at: create_time)
    customer_4 = create(:customer, created_at: time_2)

    get "/api/v1/customers/find_all?created_at=#{create_time}"

    expect(response).to be_successful

    customers = JSON.parse(response.body, symbolize_names: true)

    expect(customers[:data].count).to eq(3)
  end

  it "can search random and get back a random customer" do
    customer = create(:customer)

    get '/api/v1/customers/random'
    expect(response).to be_successful

  end
end
