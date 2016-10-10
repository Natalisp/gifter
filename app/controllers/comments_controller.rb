class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    gift = Gift.find_by(id: params[:id])
    @comment = gift.comments.create(comment_params)
    if @comment.save
      redirect_to gift_path(gift)
    end
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :gift_id, :content)
  end

end
