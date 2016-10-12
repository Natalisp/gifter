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
  end


end
