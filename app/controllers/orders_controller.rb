class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :area_id, :city, :place, :building, :phone_number, :order).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def sold_item
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    unless @item.order == nil
      redirect_to root_path
    end
  end

end


























