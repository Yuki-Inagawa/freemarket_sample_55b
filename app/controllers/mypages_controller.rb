class MypagesController < ApplicationController
  before_action :set_categories
  def show
    # @item = Item.find(params[:id])
    # @image = @item.images[0]
    # @other_items = Item.where("user_id= #{@item.user.id}").order('id DESC').limit(6)
  end

  def profile
  end

  def identification
    @address = Address.find(current_user.id)
  end

  def card
  end

  def card_create
  end

  def logout
  end

  def listing_list
    @user = User.find(current_user.id)
    @items = @user.items
  end

  def listing_completed
    @user = User.find(current_user.id)
    @items = @user.items
  end

  def purchased
    @user = User.find(current_user.id)
    @items = Transaction.where(user_id: current_user.id)
  end

private
    
  def set_categories
    @categories = Category.all
  end  


end
