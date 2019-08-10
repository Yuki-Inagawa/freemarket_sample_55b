class UsersController < ApplicationController
  before_action :set_user
  
  def show
    @items = @user.items
    # @categories = Category.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
