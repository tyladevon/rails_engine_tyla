class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    items = Item.where(merchant.id == params[:id])
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

end
