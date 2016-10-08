class WishlistsController < ApplicationController

  def index
    if current_user
      @wishlists = current_user.wishlists
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @wishlist = Wishlist.find_by(id: params[:id])
    @user = User.find_by(id: @wishlist.user_id)
  end

  def new
    @wishlist = Wishlist.new
    @gifts = @wishlist.gifts.build
  end

  def edit
    @wishlist = Wishlist.find_by(params[:id])
  end

  def create
    wishlist = Wishlist.new(wishlist_params)
    wishlist.user_id = current_user.id
    if wishlist.save
      redirect_to wishlist_path(wishlist)
    else
      render action: 'new'
    end
  end

  def update
    wishlist = Wishlist.find(params[:id])
    if wishlist.update(wishlist_params)
      redirect_to wishlist
    else
      render action: 'edit'
    end
  end

  def destoy
    @wishlist.destroy
    redirect_to wishlists_url
  end

private

  def wishlist_params
    params.require(:wishlist).permit(:name, :gifts_attributes => [:name, :link])
  end

end
