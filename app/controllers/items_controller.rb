class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end
  
  def new
    @item = Item.new
    @category = Category.all
    @status = Status.all
    @shipping_fee = ShippingFee.all
    @from_location = FromLocation.all
    @days_till_ship = DaysTillShip.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @category = Category.all
      @status = Status.all
      @shipping_fee = ShippingFee.all
      @from_location = FromLocation.all
      @days_till_ship = DaysTillShip.all
      render :new
    end
    def show
      @item = Item.find(params[:id])
    end
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :price, :category_id, :status_id, :shipping_fee_id, :from_location_id, :days_till_ship_id).merge(user_id: current_user.id)
  end
end
