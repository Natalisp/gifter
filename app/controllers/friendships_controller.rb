class FriendshipsController < ApplicationController

  def index
    @users = Users.all
  end

  def show
  end

  def create
    @friendship = Friendship.new(friendship_params)
    friendship.save
    redirect_to root_url
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to root_url
  end

  private
  def friendship_params
    params.require(:friendship)
  end
end
