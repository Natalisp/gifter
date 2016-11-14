class WishlistSerializer < ActiveModel::Serializer
  attributes :id
  has_many :gifts
end
