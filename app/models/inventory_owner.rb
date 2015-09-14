class InventoryOwner < ActiveRecord::Base
  belongs_to :inventory_item, class_name: "InventoryItem", foreign_key: "inventory_item_id"
  belongs_to :quantity_type, class_name: "QuantityType", foreign_key: "quantity_type_id"
  belongs_to :person
  belongs_to :stored_in, class_name: "InventoryItem", foreign_key: "stored_in_id"

    validates :inventory_item, :presence => true
end
