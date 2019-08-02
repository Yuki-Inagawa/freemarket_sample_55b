class MypagesController < ApplicationController
  def show
    # @item = Item.find(params[:id])
    # @image = @item.images[0]
    # @other_items = Item.where("user_id= #{@item.user.id}").order('id DESC').limit(6)
  end

  def profile
  end

  def identification
    @user = User.find(params[:id])
    @address = @user.address
  end

  def card
  end

  def card_create
  end

  def logout
  end

  def listing_list
    @user = User.find(1)
    @items = @user.items
  end

end
