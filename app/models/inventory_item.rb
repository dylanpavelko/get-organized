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


  def average_price_by(desired_unit)
    unit = desired_unit.standardized
    #get all transactions for inventory item
    @transactions = Transaction.where(:inventory_item_id => self.id)
    @total_cost = 0
    #accumulate costs for each transaction for inventory item
    @transactions.each do |transaction|
      @standard_unit_type = ""
      if  transaction.quantity_type != nil and self.quantity_type != nil
        #get_unit_type_of_transaction
        @standard_unit_type = transaction.quantity_type.standardized
        @amount = Unit.new(transaction.amount.to_s + @standard_unit_type)
        #if mass-volume unit type mismatch perform conversion
        if self.quantity_type.standardized != " "
          @amount = @amount.convert_to(self.quantity_type.standardized).scalar
        end
        @adjusted_price = transaction.price / @amount.scalar
      elsif transaction.amount == nil or transaction.amount == ""
        @amount = 1
        @adjusted_price = transaction.price / @amount
      else
        @amount = transaction.amount
        @adjusted_price = transaction.price / @amount
      end
      @total_cost = @total_cost + @adjusted_price
    end
    if @transactions.count != 0
      return (@total_cost.to_f / @transactions.count)
    else
      return nil
    end
  end


end
