class GiftsController < ApplicationController

  def show
    @gift = Gift.find_by(id: params[:id])
    if @gift
      @user = @gift.wishlist.user
      @wishlist = @gift.wishlist
      @comments = @gift.comments.all
      @comment = Comment.new
      respond_to do |format|
      format.html { render :show }
      format.json { render json: @gift, include:  ['comments', 'comment.user': @user] }
    end
    else
      redirect_to root_path
    end
  end

  def create
    @wishlist = Wishlist.find_by(id: params[:gift][:wishlist_id])
    if !@wishlist.gifts.include?(Gift.find_by(name: params[:gift][:name]))
       @gift = @wishlist.gifts.create(gift_params)
       if @gift.save
         flash[:alert] = "Your gift was successfully added!"
         redirect_to user_wishlist_path(current_user, @wishlist)
       else
         flash[:alert] = "Couldn't add the gift, try again!"
         redirect_to user_wishlist_path(current_user, @wishlist)
       end
    else
       flash[:alert] = "Already in the list!"
       redirect_to user_wishlist_path(current_user, @wishlist)
    end
  end

  def edit
    @gift = Gift.find(params[:id])
    if @gift.wishlist.user != current_user
      redirect_to root_path
    elsif
      @gift = Gift.find(params[:id])
    end
  end

  def update
    @gift = Gift.find(params[:id])
    wishlist = @gift.wishlist
     if params[:gift][:status] == "receiving"
        @gift.friend_buyer(wishlist_id: wishlist.id, gift_id: @gift.id, friend_buyer_id: current_user.id)
        @gift.update(gift_params)
        redirect_to gift_path(@gift)
     else
       @gift.update(gift_params)
       redirect_to user_wishlist_path(current_user, @gift.wishlist)
   end
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to user_wishlist_path(current_user, @gift.wishlist)
  end


  private
  def gift_params
    params.require(:gift).permit(:id, :name, :link, :wishlist_id, :status)
  end

end
