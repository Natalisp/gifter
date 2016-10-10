class GiftsController < ApplicationController
  def show
    @gift = Gift.find_by(id: params[:id])
    @user = @gift.wishlist.user
    @comments = @gift.comments.all
    @comment = @gift.comments.build
  end

  # def new
  #   @gift = Gift.new
  # end

  def create
    @wishlist = Wishlist.find_by(id: params[:gift][:wishlist_id])
    if !@wishlist.gifts.include?(Gift.find_by(name: params[:gift][:name]))
       @gift = @wishlist.gifts.create(gift_params)
       if @gift.save
         flash[:notice] = "Your gift was successfully added!"
         redirect_to user_wishlist_path(current_user, @wishlist)
       else
         flash[:notice] = "Couldn't add the gift, try again!"
         redirect_to user_wishlist_path(current_user, @wishlist)
       end
    else
       flash[:notice] = "Already in the list"
       redirect_to user_wishlist_path(current_user, @wishlist)
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    redirect_to user_wishlist_path(current_user, @gift.wishlist)
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to user_wishlist_path(current_user, @gift.wishlist)
  end


  private
  def gift_params
    params.require(:gift).permit(:name, :link, :wishlist_id)
  end

end
