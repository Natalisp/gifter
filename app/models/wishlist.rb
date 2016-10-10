class Wishlist < ApplicationRecord
  has_many :gifts
  belongs_to :user

  def gift_attributes=(gift)
    gift = Gift.find_or_create_by(name: gift[:name], link: gift[:link])
    gifts << gift
  end


end
