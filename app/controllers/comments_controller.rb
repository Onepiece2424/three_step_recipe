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
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    if current_user.id == @comment.user.id
      @comment.destroy
      redirect_to recipe_path(params[:recipe_id])
    else
      redirect_to recipe_path(params[:recipe_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_content,:recipe_id)
  end
end
