class Gift < ApplicationRecord
  has_many :comments
  belongs_to :wishlist
  has_one :wishlist_gifts
  has_one :friend_buyer, through: :wishlist_gifts, :source => 'User'
end
