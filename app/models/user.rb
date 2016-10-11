class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend
  has_many :wishlists
  has_many :gifts, through: :wishlists
  has_many :comments
  has_many :wishlist_gifts, foreign_key: "friend_buyer_id"
  has_many :purchases, through: :wishlist_gifts, source: :gift

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.search(search)
    where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end


end
