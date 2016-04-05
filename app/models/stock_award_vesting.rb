class StockAwardVesting < ActiveRecord::Base
  belongs_to :stock_award

  def date
    return self.vest_date
  end
end
