class FriendshipsController < ApplicationController

  def index
    @users = Users.all
  end

  def show
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.save
    redirect_to user_url(User.find_by(id: params[:friend_id]))
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
