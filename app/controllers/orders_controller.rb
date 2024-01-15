class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.includes(:user).find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      @order.save
      redirect_to items_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:postcode, :shipping_area_id, :city, :street_address, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
