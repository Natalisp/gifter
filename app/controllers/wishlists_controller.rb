class WishlistsController < ApplicationController

  def index
    if current_user
      @user = User.find_by(id: params[:user_id])
      @wishlists = @user.wishlists
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @wishlist = Wishlist.find_by(id: params[:id])
    @gifts = @wishlist.gifts
  end

  def new
    @wishlist = Wishlist.new
    @gift = @wishlist.gifts.build
  end

  def edit
    @wishlist = Wishlist.find_by(id: params[:id])
    @user = current_user
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
    @wishlist = Wishlist.find_by(id: params[:id])
     if @wishlist.update(wishlist_params)
       redirect_to user_wishlist_path(current_user, @wishlist)
     else
       redirect_to user_wishlist_path(current_user, @wishlist)
    end
  end

  def destroy
    @wishlist = current_user.wishlists.find_by(id: params[:id])
    @wishlist.destroy
    redirect_to user_wishlists_path
  end

private

  def wishlist_params
    params.require(:wishlist).permit(:name, gifts_attributes: [:name, :link])
  end

end
