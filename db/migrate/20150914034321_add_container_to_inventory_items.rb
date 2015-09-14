class AddContainerToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :container, :boolean
  end
end
