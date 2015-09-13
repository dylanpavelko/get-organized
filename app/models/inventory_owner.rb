class InventoryOwner < ActiveRecord::Base
  belongs_to :inventory_item, class_name: "InventoryItem", foreign_key: "inventory_item_id"
  belongs_to :quantity_type
  belongs_to :person

    validates :inventory_item, :presence => true
end
