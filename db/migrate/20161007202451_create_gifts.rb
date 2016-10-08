class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :link
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
