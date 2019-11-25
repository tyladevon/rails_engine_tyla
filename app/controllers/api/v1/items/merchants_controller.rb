class Api::V1::Items::MerchantsController < ApplicationController

  def show
    items = Item.find(params[:id])
    serialized_merchant = MerchantSerializer.new(items.merchant)
    render json: serialized_merchant
  end

end
