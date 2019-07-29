class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all.includes(:images).order('id DESC').limit(4)
  end

  def new 
    @item = Item.new
    10.times { @item.images.build }
  end

  
  def create
    @item = Item.new(item_params)
    @item.save
      redirect_to root_path
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.update(item_params)
        redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
