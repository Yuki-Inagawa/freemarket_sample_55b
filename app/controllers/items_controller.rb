class ItemsController < ApplicationController
  def index
    # @
  end

  def new 
    @item = Item.new
    @item.images.build
  end

  
  def create
    Item.create(item_params) 
      redirect_to root_path
  end
  
  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @other_items = Item.where("user_id= #{@item.user.id}")
  end

  def buy_confirmation
  end


  private
  def item_params
    params.require(:item).permit(:name, :text, :state, :postage_type, :region, :shopping_date, :delivery_method, :price, image_attributes:[:image]).merge(user_id:1)
  end
  
end
