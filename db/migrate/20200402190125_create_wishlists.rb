class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :name
      t.string :list_item
      t.integer :user_id   
    end 
  end
end
