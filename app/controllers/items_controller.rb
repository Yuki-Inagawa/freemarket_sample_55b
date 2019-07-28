class ItemsController < ApplicationController
  def index
  end

  def new 
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @other_items = Item.where("user_id= #{@item.user.id}")
  end

  def buy_confirmation
  end

end