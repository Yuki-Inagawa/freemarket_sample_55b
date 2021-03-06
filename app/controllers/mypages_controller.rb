class MypagesController < ApplicationController
  before_action :set_categories
  def show
    transaction = current_user.transactions
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
    card = Card.find_by(id: current_user.id)
    user = User.find(params[:id])
    Payjp.api_key = "sk_test_8a3bd63574f274676a543f16"
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    # binding.pry
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
    transaction = current_user.transactions
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
