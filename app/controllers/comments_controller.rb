class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    gift = Gift.find(params[:gift_id])
    @comments = gift.comments
    render json: @comments, each_serializer: CommentSerializer 
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def create
    gift = Gift.find_by(id: params[:gift_id])
    @comment = gift.comments.build(content: params[:content], user_id: current_user.id)
    # byebug
    if @comment.save
      render json: @comment
    else
      flash[:alert] = "Your comment wasn't posted!"
      redirect_to gift_path(gift)
    end
  end

  def destroy
     gift = Gift.find_by(id: params[:gift_id])
     @comment = gift.comments.find_by(id: params[:id])
     @comment.destroy
     flash[:alert] = "Your comment was deleted!"
     redirect_to gift_path(gift)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :content, :gift_id)
  end

end
