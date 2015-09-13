class CreateInventoryOwners < ActiveRecord::Migration
  def change
    create_table :inventory_owners do |t|
      t.references :inventory_item, index: true
      t.decimal :amount
      t.references :quantity_type, index: true
      t.references :person, index: true

      t.timestamps
    end
  end
end
