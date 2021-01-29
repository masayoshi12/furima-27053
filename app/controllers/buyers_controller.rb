class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  #before_action :user_confirmation, only:  [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:buyer_id, :postal_code, :municipalities, :house_number, :phone_number, :prefecture_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  #def user_confirmation
  #  redirect_to root_path if current_user == @item.user
  #end

end
