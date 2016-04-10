class StockSale < ActiveRecord::Base
  belongs_to :person
  belongs_to :stock
  belongs_to :stock_purchase
  belongs_to :stock_award
  belongs_to :stock_award_vesting, class_name: "StockAwardVesting", foreign_key: "stock_award_vesting_id"

  def date
  	return self.trade_date
  end
end
