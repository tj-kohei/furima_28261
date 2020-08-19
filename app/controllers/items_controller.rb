class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :price, :category_id, :status_id, :shipping_fee_id, :from_location_id, :days_till_ship_id).merge(user_id: current_user.id)
  end
end
