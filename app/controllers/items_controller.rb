class ItemsController < ApplicationController

  before_action :move_to_sessions_new, except: [:new]
  before_action :move_to_index, except: [:index, :show]
  
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
    return if user_signed_in?

    redirect_to user_session_path
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
