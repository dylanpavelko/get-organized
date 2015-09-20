class AddPublicToInventoryItem < ActiveRecord::Migration
  def change
    add_column :inventory_items, :public, :boolean
  end
end
