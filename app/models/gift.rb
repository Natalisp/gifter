class Gift < ApplicationRecord
  has_many :comments
  belongs_to :wishlist
  has_many :wishlist_gifts
  has_many :friend_buyers, through: :wishlist_gifts
end
