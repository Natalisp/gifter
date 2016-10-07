class Gift < ApplicationRecord
  has_many :comments
  belongs_to :wishlist
end
