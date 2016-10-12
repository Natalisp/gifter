class WishlistGiftsController < ApplicationController

def create
  # gift = Gift.find(params[:id])
  # wishlist = gift.wishlist
  # gift.friend_buyer(wishlist_id: wishlist.id, gift_id: gift.id, friend_buyer_id: current_user.id)
end

def destroy
  gift = Gift.find(params[:id])
  wishlist_gift = gift.wishlist_gifts.find_by(friend_buyer_id: current_user.id, gift_id: params[:id])
  wishlist_gift.destroy
  flash[:notice] = "You are not buying this anymore for your friend"
  redirect_to gift_path(gift)
end


end
