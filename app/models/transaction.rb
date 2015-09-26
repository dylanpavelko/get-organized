class Transaction < ActiveRecord::Base
  belongs_to :inventory_item, class_name: "InventoryItem", foreign_key: "inventory_item_id"
  belongs_to :buyer_person, class_name: "Person", foreign_key: "buyer_person_id"
  belongs_to :seller_business, class_name: "Business", foreign_key: "seller_business_id"
  belongs_to :quantity_type
  
  validates :inventory_item_id, :presence => true
end
