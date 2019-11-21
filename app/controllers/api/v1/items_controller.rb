class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end

  def find
    item = Item.find_by(find_params)
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end

  def find_all
      item = Item.where(find_params)
      serialized_item = ItemSerializer.new(item)
      render json: serialized_item
  end

  private

  def find_params
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at)
  end

end
