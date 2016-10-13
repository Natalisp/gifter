class Wishlist < ApplicationRecord
  has_many :wishlist_gifts
  has_many :gifts
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :satisfaction, -> { joins(:gifts).where(:gifts => {:status => "receiving" }) }

  # def gifts_attributes=(attributes)
  #   attributes.each { |i, gift_attr| self.gifts.build(gift_attr)}
  # end

def gifts_attributes=(attributes)
  attributes.each do |i, gift_attr|
    gift = Gift.find_or_create_by(gift_attr)
    self.gifts << gift
  end
  save
end


end
