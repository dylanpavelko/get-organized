class CreateStockSales < ActiveRecord::Migration
  def change
    create_table :stock_sales do |t|
      t.references :person, index: true
      t.references :stock, index: true
      t.references :stock_purchase, index: true
      t.references :stock_award, index: true
      t.date :trade_date
      t.decimal :price
      t.integer :shares
      t.decimal :fees

      t.timestamps
    end
  end
end
