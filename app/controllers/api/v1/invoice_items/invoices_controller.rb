class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    invoice_items = InvoiceItem.find(params[:id])
    serialized_invoice = InvoiceSerializer.new(invoice_items.invoice)
    render json: serialized_invoice
  end

end
