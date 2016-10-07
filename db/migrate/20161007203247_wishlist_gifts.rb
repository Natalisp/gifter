class WishlistGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :wishlist_gifts do |t|
      t.integer :wishlist_id
      t.integer :gift_id
      t.string :gift_status
      t.integer :friend_buyer_id

      t.timestamps
    end
  end
end
