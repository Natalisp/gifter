class WishlistGift < ApplicationRecord
  belongs_to :wishlist
  belongs_to :gift
  belongs_to :user
end
