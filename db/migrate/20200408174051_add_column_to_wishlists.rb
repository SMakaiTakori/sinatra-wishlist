class AddColumnToWishlists < ActiveRecord::Migration
  def change
    add_column :wishlists, :item_description, :string
  end
end
