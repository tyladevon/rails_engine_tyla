class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    invoices = Invoice.where(merchant_id: params[:id])
    serialized_invoices = InvoiceSerializer.new(invoices)
    render json: serialized_invoices
  end

end
