class CommentsController < ApplicationController
  def create
    @comment = Comment.create()
    redirect_to root_path
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id:1).merge(item_id:1)
  end

end
