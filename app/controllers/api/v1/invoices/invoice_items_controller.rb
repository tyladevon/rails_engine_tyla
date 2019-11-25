class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    invoices = Invoice.find(params[:id])
    invoice_items = InvoiceItem.where(invoice_id: params[:id])
    serialized_invoice_items = InvoiceItemSerializer.new(invoice_items)
    render json: serialized_invoice_items
  end

end
