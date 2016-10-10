class Wishlist < ApplicationRecord
  has_many :gifts
  belongs_to :user

  # accepts_nested_attributes_for :gifts

  def gifts_attributes=(attributes)
    attributes.each { |i, gift_attr| self.gifts.build(gift_attr)}
    # gift = Gift.find_or_create_by(name: gift[:name], link: gift[:link])
    # gifts << gift
  end

end
