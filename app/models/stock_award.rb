class StockAward < ActiveRecord::Base
  belongs_to :person
  belongs_to :stock
  belongs_to :award_type, class_name: "StockAwardType", foreign_key: "award_type_id"

  def shares_vested(vestings)
  	@vested = 0
  	vestings.each do |vest|
  		if vest.vest_date <= Date.today
  			@vested = @vested + vest.vest_quantity
  		end
  	end
  	return @vested
  end

  def shares_unvested(vestings)
    return shares - self.shares_vested(vestings)
  end

  def shares_exercised(purchases)
  	@purchased = 0
  	purchases.each do |purchase|
  		@purchased = @purchased + purchase.shares
  	end
  	return @purchased
  end

  def shares_available_for_sale(vestings, purchases, sales)
  	if self.award_type.name == "ISO"
  		return shares_exercised(purchases) - shares_sold(sales)
  	else
  		return shares_vested(vestings) - shares_sold(sales)
  	end
  end

  def accessible_value(price)
    vestings = StockAwardVesting.where(:stock_award_id => self.id)
    purchases = StockPurchase.where(:stock_award_id => self.id)
    sales = StockSale.where(:stock_award_id => self.id)
    @value = (shares_available_for_sale(vestings, purchases, sales) * price) #- (shares_exercisable(vestings, purchases) * (self.grant_price.to_f))
    return @value
  end

  def taxable_gains(vestings, price)
    gains = 0
puts "gains"
puts gains
    vestings.each do |vest|
      if vest.vest_date <= Date.today #if the shares have been vested
        #try to find and same day sell 
        @sales = StockSale.where(:stock_award_id => self.id, :trade_date => vest.vest_date)
        if @sales.count > 0
          @vest_price = @sales.first.price
          @post_vest_gains = price - @vest_price
puts vest.available_shares
          gains = gains + (vest.available_shares * @post_vest_gains)
        end
      end
puts gains
    end
    return gains
  end

  def vested_post_tax_estimated_gains(vestings, price)
  end

  def shares_sold(sales)
  	@sold = 0
  	sales.each do |sale|
  		@sold = @sold + sale.shares
  	end
  	return @sold
  end

  def shares_sold_value(sales)
  	@value = 0
  	sales.each do |sale|
  		@value = @value + (sale.shares * sale.price) - sale.fees
  	end
  	return @value
  end

  def sold_value
    sales = StockSale.where(:stock_award_id => self.id)
    @value = 0
    sales.each do |sale|
      @value = @value + (sale.shares * sale.price) - sale.fees
    end
    return @value
  end

  def unvested_value(price)
    vestings = StockAwardVesting.where(:stock_award_id => self.id)
    return price * (self.shares - self.shares_vested(vestings))
  end

  def shares_exercisable(vestings, purchases)
  	if self.award_type.name == "ISO"
  		return shares_vested(vestings) - shares_exercised(purchases)
  	else
  		return shares_vested(vestings)
  	end
  end

  def shares_in_schedule(vestings)
  	 @shares = 0
  	vestings.each do |vest|
  			@shares = @shares + vest.vest_quantity
  	end

  	return @shares
  end

end
