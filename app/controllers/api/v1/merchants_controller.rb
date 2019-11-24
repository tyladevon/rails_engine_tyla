class Api::V1::MerchantsController < ApplicationController

  def index
    merchant = Merchant.all
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def show
    merchant = Merchant.find(params[:id])
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def find
   merchant = Merchant.find_by(find_params)
   serialized_merchant = MerchantSerializer.new(merchant)
   render json: serialized_merchant
  end

  def find_all
      merchant = Merchant.where(find_params)
      serialized_merchant = MerchantSerializer.new(merchant)
      render json: serialized_merchant
  end

  def random
    merchant = Merchant.random
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  private

  def find_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
