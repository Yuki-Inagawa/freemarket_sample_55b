class MypagesController < ApplicationController
  before_action :set_categories
  def show
    # @item = Item.find(params[:id])
    # @image = @item.images[0]
    # @other_items = Item.where("user_id= #{@item.user.id}").order('id DESC').limit(6)
    transaction = Transaction.where(user_id: current_user.id)
    item = []
    transaction.each do |transaction|
      item << transaction.item_id
    end
    @items = Item.where(id: item)
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
    transaction = Transaction.where(user_id: current_user.id)
    item = []
    transaction.each do |transaction|
      item << transaction.item_id
    end
    @items = Item.where(id: item)
  end

private
    
  def set_categories
    @categories = Category.all
  end  


end
