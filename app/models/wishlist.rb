class Wishlist < ApplicationRecord
  has_many :gifts
  belongs_to :user
  accepts_nested_attributes_for :gifts, reject_if: proc { |attributes| attributes['name'].blank? }
end
