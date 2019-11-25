class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def show
    invoice_items = InvoiceItem.find(params[:id])
    serialized_item = ItemSerializer.new(invoice_items.item)
    render json: serialized_item
  end

end
