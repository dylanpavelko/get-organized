class ActivityHasInventoryItem < ActiveRecord::Base
  belongs_to :activity
  belongs_to :inventory_item
end
