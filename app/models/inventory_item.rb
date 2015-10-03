class InventoryItem < ActiveRecord::Base
  belongs_to :quantity_type
  belongs_to :category, class_name: "Category", foreign_key: "category_id"
  belongs_to :subcategory
  belongs_to :public_status, foreign_key: "public"

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

  def self.get_all_public_and_my_items(current_user)
    mine = Array.new
    InventoryItem.all.each do |item|
      if item.is_public == true or item.owner(current_user) == current_user.person_id
        mine << item
      end
    end
    return mine
  end

  def owner(current_user)
    @ownerships = InventoryOwner.where(:inventory_item_id => self.id)
    if @ownerships.count > 0 
      return @ownerships.first.person_id
    else
      return nil
    end
  end

  def is_public
    return self.public
  end

end
