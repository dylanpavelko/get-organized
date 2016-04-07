class AddStockAwardVestingToStockSale < ActiveRecord::Migration
  def change
    add_reference :stock_sales, :stock_award_vesting, index: true
  end
end
