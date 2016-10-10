class AddStatusToGifts < ActiveRecord::Migration[5.0]
  def change
    add_column :gifts, :status, :string, :default => "wishing"
  end
end
