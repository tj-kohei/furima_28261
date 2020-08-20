class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :owner?, only: [:edit, :update, :delete]
  
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

    def edit
    end

    def update
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit
    end
  end
    def destroy
      if @item.destroy
        redirect_to items_path
      else
        render item_path(@item)
    end
  end

  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end
  
  def owner?
    if @item.user != current_user
      redirect_to items_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :item_detail, :price, :category_id, :status_id, :shipping_fee_id, :from_location_id, :days_till_ship_id).merge(user_id: current_user.id)
  end
end
