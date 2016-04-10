class StockAwardVesting < ActiveRecord::Base
  belongs_to :stock_award

  def date
    return self.vest_date
  end

  def available_shares
  	@sales = StockSale.where(:stock_award_vesting_id => self.id)
  puts "number of sales"
  puts @sales.count
  	@total_sold = 0
  	@sales.each do |sale|
  		@total_sold = @total_sold + sale.shares
  	end
  	return self.vest_quantity - @total_sold
  end
end
