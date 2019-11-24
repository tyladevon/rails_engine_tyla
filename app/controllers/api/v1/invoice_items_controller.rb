class Api::V1::InvoiceItemsController < ApplicationController

  def index
    invoice_item = InvoiceItem.all
    serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

  def show
    invoice_item = InvoiceItem.find(params[:id])
    serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

  def find
    invoice_item = InvoiceItem.find_by(find_params)
    serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

  def find_all
      invoice_item = InvoiceItem.where(find_params)
      serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
      render json: serialized_invoice_item
  end

  def random
    invoice_item = InvoiceItem.random
    serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

  private

  def find_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end
