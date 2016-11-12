class UsersController < ApplicationController

  def index
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user
      @purchases = current_user.purchases
    end
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @user }
    end
  end


end
