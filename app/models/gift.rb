class Gift < ApplicationRecord
  has_many :comments
  belongs_to :wishlist
  has_many :wishlist_gifts
  has_many :friend_buyers, through: :wishlist_gifts
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :receiving, -> {where(status: "receiving")}
  scope :waiting, -> { where(status: "wishing") }


  def friend_buyer(wishlist_gifts_attr)
    self.wishlist_gifts.build(wishlist_gifts_attr)
  end

end
