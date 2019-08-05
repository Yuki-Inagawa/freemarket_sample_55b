class CategoriesController < ApplicationController
  def index
  @category = Category.find(1)
  @children = @category.children
  end
end
