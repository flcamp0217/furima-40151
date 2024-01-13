class OrderController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order =Order.new
  end

  def create
    @order =Order.new(purchase_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(order).permit(:user, :item).merge(user_id: current_user.id, item_id: @item.id)
  end
end
