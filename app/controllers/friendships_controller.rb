class FriendshipsController < ApplicationController

  def create
    if current_user.friendships.include?(Friendship.find_by(friend_id: params[:friend_id], user_id: current_user.id))
       redirect_to friendships_path
    else
        friendship = current_user.friendships.build(friend_id: params[:friend_id])
        current_user.save
        friend = User.find_by(id: params[:friend_id])
        friend.friendships.build(friend_id: current_user.id)
        friend.save
        redirect_to friendships_path
      end
  end

  def destroy
    friendship = current_user.friendships.find(params[:id])
    friendship.destroy
    flash[:notice] = "Removed #{friendship.friend.first_name} from friends"
    redirect_to friendships_path
  end

  private

  def friendship_params
    params.require(:friendship)
  end

end
