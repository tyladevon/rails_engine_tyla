class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    serialized_customer = CustomerSerializer.new(invoice.customer)
    render json: serialized_customer
  end

end
