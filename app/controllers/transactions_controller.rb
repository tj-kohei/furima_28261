class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :sold_out?
  def index
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(item_id: @item.id, user_id: current_user.id)
    if @purchase.valid? 
      payjp_charge
      @purchase.save
      redirect_to root_path
    else
      @purchase.destroy
      render item_transactions_path
    end
  end
  
  private
  def set_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def address_params
    params.permit(:postal_code, :from_location_id, :city, :house_number, :building_name, :phone_number).merge(purchase_id: @purchase.id)
  end

  def sold_out?
    redirect_to root_path if @item.purchase.present?
  end

  def payjp_charge
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:card_token],
      currency: 'jpy'
    )
  end
end

