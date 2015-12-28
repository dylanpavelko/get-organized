class StockSale < ActiveRecord::Base
  belongs_to :person
  belongs_to :stock
  belongs_to :stock_purchase
  belongs_to :stock_award
end
