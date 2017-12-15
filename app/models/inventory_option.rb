class InventoryOption < ActiveRecord::Base
  belongs_to :inventory_item
  belongs_to :food_item, class_name: "FoodItem", foreign_key: "food_items_id"
end
