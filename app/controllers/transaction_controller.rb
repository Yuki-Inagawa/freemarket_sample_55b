class TransactionController < ApplicationController
  before_action :set_item, :set_user

  def index
    @image = Image.find_by(item_id: @item.id)
    @address = @user.addresses
  end

  private
    
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
