class InventoryItem < ActiveRecord::Base
  belongs_to :quantity_type
  belongs_to :category
  belongs_to :subcategory

  def full_name
  	return self.brand + ' ' + self.detail + ' ' + self.name
  end

end
