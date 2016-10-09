class FriendshipsController < ApplicationController

  def index
    @friendships = current_user.friendships
  end

  def show
  end

  def create
    if current_user.friendships.include?(Friendship.find_by(friend_id: params[:friend_id], user_id: current_user.id))
       redirect_to friendships_path
    else
        @friendship = current_user.friendships.build(friend_id: params[:friend_id])
        friend = User.find_by(id: params[:friend_id])
        friend.friendships.build(friend_id: current_user.id)
        @friendship.save
        current_user.save
        friend.save
        redirect_to friendships_path
      end
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
