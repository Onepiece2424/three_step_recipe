class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    @comment.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content,:recipe_id)
  end
end
