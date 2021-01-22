class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    # @items = Item.all
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :explanation, :price, :category_id, :state_id, :fee_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end
end
