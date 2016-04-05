class StockPurchase < ActiveRecord::Base
  belongs_to :person
  belongs_to :stock
  belongs_to :stock_purchase_type
  belongs_to :stock_award

  def accessible_value(price)
  	return price * shares
  end

  def date
  	return self.acquired_date
  end
end
