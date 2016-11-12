class Wishlist < ApplicationRecord
  has_many :wishlist_gifts
  has_many :gifts, dependent: :destroy
  belongs_to :user
  validates_presence_of :name
  validates_uniqueness_of :name
  scope :satisfaction, -> { joins(:gifts).where(:gifts => {:status => "receiving" }) }

  # def gifts_attributes=(attributes)
  #   attributes.each { |i, gift_attr| self.gifts.build(gift_attr)}
  # end

  def gifts_attributes=(attributes)
    attributes.each do |i, gift_attr|
      gift = Gift.find_by(id: gift_attr["id"])
      if gift
        gift.update(gift_attr)
      else

        gift = Gift.create(name: gift_attr[:name], link: gift_attr[:link])
        self.gifts << gift
      end
    end
    save
  end


end
