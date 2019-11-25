class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    serialized_items = ItemSerializer.new(invoice.items)
    render json: serialized_items
  end

end
