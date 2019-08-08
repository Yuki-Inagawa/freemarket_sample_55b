class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      # binding.pry
      respond_to do |format|
        format.html { redirect_to "item_path"}
        format.json
      end
    else
      render("items/show")
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
