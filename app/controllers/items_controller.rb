class ItemsController < ApplicationController
  before_action :move_to_sessions_new, only: [:new, :edit, :destroy]
  before_action :params_find, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit]
  def index
    @items = Item.includes(:user).order('created_at DESC')
    @purchases = Purchase.includes(:item)
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_show, :category_id, :quality_id, :postage_id, :shipping_area_id,
                                 :delivery_time_id, :price)
          .merge(user_id: current_user.id)
  end

  def move_to_sessions_new
    return if user_signed_in?

    redirect_to user_session_path
  end

  def move_to_index
    return unless current_user.id != @item.user_id || @item.purchase.present?

    redirect_to action: :index
  end

  def params_find
    @item = Item.find(params[:id])
  end
end
