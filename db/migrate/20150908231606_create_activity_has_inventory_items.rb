class CreateActivityHasInventoryItems < ActiveRecord::Migration
  def change
    create_table :activity_has_inventory_items do |t|
      t.references :activity, index: true
      t.references :inventory_item, index: true

      t.timestamps
    end
  end
end
