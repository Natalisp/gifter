class Gift < ApplicationRecord
  has_many :comments
  belongs_to :wishlist
  has_many :wishlist_gifts
  has_many :friend_buyers, through: :wishlist_gifts
  validates_presence_of :name
  scope :receiving, -> {where(status: "receiving")}
  scope :waiting, -> { where(status: "wishing")   }
end
