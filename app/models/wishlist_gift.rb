class WishlistGift < ApplicationRecord
  belongs_to :wishlist
  belongs_to :gift
  belongs_to :friend_buyer, :class_name => "User"
end
