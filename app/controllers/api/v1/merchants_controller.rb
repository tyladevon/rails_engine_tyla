class Api::V1::MerchantsController < ApplicationController

  def index
    render json: Merchant.all
  end

  def show
    merchant = Merchant.find(params[:id])
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

end
