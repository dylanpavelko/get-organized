class Stock < ActiveRecord::Base
  belongs_to :business

  def quote
  	stocks = StockQuote::Stock.quote(self.symbol)
  end
end
