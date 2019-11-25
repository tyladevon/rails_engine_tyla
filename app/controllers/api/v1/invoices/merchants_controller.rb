class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    serialized_merchant = MerchantSerializer.new(invoice.merchant)
    render json: serialized_merchant
  end

end
