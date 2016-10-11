class RemoveGiftStatusFromWishlistGifts < ActiveRecord::Migration[5.0]
  def change
    remove_column :wishlist_gifts, :gift_status, :string
  end
end
