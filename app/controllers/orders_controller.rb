class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_top, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to items_path
    else
      @item = Item.find(params[:item_id])
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:postcode, :shipping_area_id, :city, :street_address, :building, :phone).merge(
     user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_top
    @item = Item.includes(:user).find(params[:item_id])
    return unless current_user.id == @item.user_id

    redirect_to root_path
  end
end
