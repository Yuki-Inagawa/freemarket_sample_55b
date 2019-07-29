class ItemsController < ApplicationController


  def index
    @items = Item.all.includes(:images).limit(4)
  end

  def new 
  end

  def show
  end

  def buy_confirmation
  end

end
