class GiftsController < ApplicationController
  def show
    @gift = Gift.find_by(id: params[:id])
    @comments = @gift.comments.all
    @comment = @gift.comments.build
  end
end
