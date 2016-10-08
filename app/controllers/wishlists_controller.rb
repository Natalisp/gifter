class WishlistsController < ApplicationController
  def new
    @wishlist = Wishlist.new
  end

  def index
    @wishlists = Wishlist.all
  end

  def create
    @wishlist = Wishlist.new
  end

end
