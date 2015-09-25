class TripHasInventoryItem < ActiveRecord::Base
  belongs_to :trip
  belongs_to :inventory_item
  
  def get_amount
    if self.amount == nil
      return 1
    else
      return self.amount
    end
  end
end
