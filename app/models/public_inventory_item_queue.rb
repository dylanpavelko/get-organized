class PublicInventoryItemQueue < ActiveRecord::Base
  belongs_to :item, class_name: "InventoryItem", foreign_key: "item_id"
end
