class Wishlist < ApplicationRecord
  has_many :wishlist_gifts
  has_many :gifts
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :expectations, -> { joins(:wishlist_gifts).group("wishlist_id") & Gift.waiting }

  def gifts_attributes=(attributes)
    attributes.each { |i, gift_attr| self.gifts.build(gift_attr)}
    # gift = Gift.find_or_create_by(name: gift[:name], link: gift[:link])
    # gifts << gift
  end

end
