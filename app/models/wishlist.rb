class Wishlist < ApplicationRecord
  has_many :wishlist_gifts
  has_many :gifts
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :satisfaction, -> { where(field: true)   }

  def gifts_attributes=(attributes)
    attributes.each { |i, gift_attr| self.gifts.build(gift_attr)}
  end

end
