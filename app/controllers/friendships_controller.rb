class FriendshipsController < ApplicationController

  def index
    @users = Users.all
  end

  def show
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    friend = User.find_by(id: params[:friend_id])
    friend.friendships.build(friend_id: current_user.id)
    current_user.save
    friend.save
    redirect_to user_path(User.find_by(id: params[:friend_id]))
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    #   REDIRECT to FRIENDS list!
    redirect_to root_url
  end

  private
  def friendship_params
    params.require(:friendship)
  end
end
