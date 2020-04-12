class DeleteColumnFromWishlists < ActiveRecord::Migration
  def change
    remove_column :wishlists, :item_description, :string
  end
end
