class WishlistsController < ApplicationController

  def index
    if current_user
      @wishlists = current_user.wishlists
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @wishlist = @user.wishlists.find_by(id: params[:id])
  end

  def new
    @wishlist = Wishlist.new
    @gifts = @wishlist.gifts.build
  end

  def edit
    @wishlist = current_user.wishlists.find_by(id: params[:id])
  end

  def create
    @wishlist = current_user.wishlists.create(wishlist_params)
    if @wishlist.save
      redirect_to user_wishlist_path(current_user, @wishlist)
    else
      render action: 'new'
    end
  end

  def update
    @wishlist = current_user.wishlists.find_by(id: params[:id])
     if @wishlist.update(wishlist_params)
       redirect_to user_wishlist_path(current_user, @wishlist)
     else
      render action: 'edit'
    end
  end

  def destoy
    if @wishlist = current_user.wishlists.find_by(id: params[:id])
       @wishlist.destroy
       redirect_to wishlists_url
     else
       redirect_to user_wishlists_path(current_user)
     end
  end

private

  def wishlist_params
    params.require(:wishlist).permit(:name, :gifts_attributes => [:name, :link])
  end

end
