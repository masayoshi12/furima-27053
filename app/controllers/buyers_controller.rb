class BuyersController < ApplicationController
  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:buyer_id, :postal_code, :municipalities, :house_number, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
