class InventoryItem < ActiveRecord::Base
  belongs_to :quantity_type
  belongs_to :category, class_name: "Category", foreign_key: "category_id"
  belongs_to :subcategory

  def full_name
  	return self.brand + ' ' + self.detail + ' ' + self.name
  end

  def matches(search_string)
  	@search_pieces = search_string.split(' ')
  	@search_pieces.each do |word|
  		if !self.full_name.downcase.include? word.downcase
  			return false
  		end
  	end
  	return true
  end

end
