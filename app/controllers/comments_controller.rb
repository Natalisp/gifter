class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    gift = Gift.find_by(id: params[:gift_id])
    @comment = gift.comments.build(comment_params)
    if @comment.save
      flash[:alert] = "Your comment was successfully posted!"
      redirect_to gift_path(gift)
    else
      flash[:alert] = "Your comment wasn't posted!"
      redirect_to gift_path(gift)
    end
  end

  def destroy
     gift = Gift.find_by(id: params[:gift_id])
     @comment = gift.comments.find_by(id: params[:id])
     @comment.destroy
    #  flash[:notice] = "Comment was deleted"
     redirect_to gift_path(gift)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :gift_id)
  end

end
