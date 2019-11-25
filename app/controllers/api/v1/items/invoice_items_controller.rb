class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    items = Item.find(params[:id])
    serialized_invoice_items = InvoiceItemSerializer.new(items.invoice_items)
    render json: serialized_invoice_items
  end

end
