class Api::V1::InvoicesController < ApplicationController

  def index
    invoice = Invoice.all
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: invoice
  end

  def show
    invoice = Invoice.find(params[:id])
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

  def find
    invoice = Invoice.find_by(find_params)
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

  def find_all
      invoice = Invoice.where(find_params)
      serialized_invoice = InvoiceSerializer.new(invoice)
      render json: serialized_invoice
  end

  def random
    invoice = Invoice.random
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

  private

  def find_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
