class ItemsController < ApplicationController


  def index
    @items = Item.all.includes(:images).order('id DESC').limit(4)
  end

  def new 
    @item = Item.new
    @item.images.build
  end

  
  def create
    @item = Item.new(item_params)
    @item.save
      redirect_to root_path
  end
  
  def show
    @item = Item.find(params[:id])
    @images = @item.images
    @other_items = Item.where("user_id= #{@item.user.id}").order('id DESC').limit(6)
  end

  def buy_confirmation
  end


  private
  def item_params
    params.require(:item).permit(:name, :text, :state, :postage_type, :region, :shopping_date, :delivery_method, :price, images_attributes:[:image]).merge(user_id: current_user.id)
  end

  def image_params
    parmas.require(:image).permit(:user_id, :image[])
  end
  
end
