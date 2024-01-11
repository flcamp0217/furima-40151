class ItemsController < ApplicationController

  before_action :move_to_sessions_new, only: [:new]

  def index
   @items = Item.all
  end

  def new
   @item = Item.new
  end

  def create
   @item = Item.create(item_params)
   if @item.save
    redirect_to '/'
   else
    render :new, status: :unprocessable_entity
   end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_show, :category_id, :quality_id, :postage_id, :shipping_area_id, :delivery_time_id, :price, :user)
    .merge(user_id: current_user.id)
  end

  def move_to_sessions_new
    unless user_signed_in?
      redirect_to user_session_path
    end
  end
end
