class Api::V1::CustomersController < ApplicationController

  def index
    customer = Customer.all
    serialized_customer = CustomerSerializer.new(customer)
    render json: customer
  end

  def show
    customer = Customer.find(params[:id])
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

  def find
    customer = Customer.find_by(find_params)
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

  def find_all
      customer = Customer.where(find_params)
      serialized_customer = CustomerSerializer.new(customer)
      render json: serialized_customer
  end

  def random
    customer = Customer.random
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

  private

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
