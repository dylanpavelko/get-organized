class TripHasInventoryItem < ActiveRecord::Base
  belongs_to :trip
  belongs_to :inventory_item
end
