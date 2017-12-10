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

  def get_stock_sales
    StockSale.where(:stock_purchase_id => self.id)
  end

  def available_for_sale(stock_sales)
    return shares - self.shares_sold(stock_sales)
  end

  def remaining_value()
    stock_sales = self.get_stock_sales
    return self.available_for_sale(stock_sales) * self.stock.get_last_price
  end

  def potential_remaining_value(stock_sales)
    return self.available_for_sale(stock_sales) * self.stock.quote.last_trade_price_only
  end

  def shares_sold(stock_sales)
    @i = 0
    stock_sales.each do |sale|
      @i = @i + sale.shares
    end
    return @i
  end

  def shares_sold_value(stock_sales)
    @v = 0
    stock_sales.each do |sale|
      @v = @v + (sale.shares * sale.price)
    end
    return @v
  end

  def realized_value()
    stock_sales = self.get_stock_sales
    @v = 0
    stock_sales.each do |sale|
      @v = @v + (sale.shares * sale.price)
    end
    return @v
  end

end
