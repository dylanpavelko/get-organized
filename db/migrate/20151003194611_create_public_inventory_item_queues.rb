class CreatePublicInventoryItemQueues < ActiveRecord::Migration
  def change
    create_table :public_inventory_item_queues do |t|
      t.references :item, index: true
      t.boolean :reviewed

      t.timestamps
    end
  end
end
