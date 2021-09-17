class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
     @item = Item.find(params[:id])
     if @item.user_id != current_user.id
       redirect_to item_path
     end
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to item_path
    end
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :charge_id, :area_id, :send_day_id, :price).merge(user_id: current_user.id)
  end
end
