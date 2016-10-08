class GiftsController < ApplicationController
  def show
    @gift = Gift.find_by(id: params[:id])
  end
end
