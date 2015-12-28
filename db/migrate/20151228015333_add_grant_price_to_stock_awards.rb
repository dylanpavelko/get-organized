class AddGrantPriceToStockAwards < ActiveRecord::Migration
  def change
    add_column :stock_awards, :grant_price, :decimal
  end
end
