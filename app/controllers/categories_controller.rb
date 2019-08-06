class CategoriesController < ApplicationController
  # top-pageでカテゴリーを表示する際に使用します。 
  def index 
  # TODO: 現状使用しておりませんが後ほどtop-pageでカテゴリーを表示する際に使用します。
  @category = Category.find(1)
  @children = @category.children
  end
end
