class WishlistsController < ApplicationController

  def index
      @user = User.find_by(id: params[:user_id])
      @wishlists = @user.wishlists
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @wishlist = Wishlist.find_by(id: params[:id])
    @gifts = @wishlist.gifts
  end

  def new
    @user = current_user
    @wishlist = Wishlist.new
    @gift = @wishlist.gifts.build
  end

  def edit
    @user = User.find(params[:user_id])
    if current_user == @user
    @wishlist = Wishlist.find_by(id: params[:id])
  else
    redirect_to root_path
  end
  end

  def create
    @user = current_user
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
    params.require(:wishlist).permit(:id, :name, gifts_attributes: [:name, :wishlist_id, :link])
  end

end
