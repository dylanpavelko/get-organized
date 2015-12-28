class CreateStockPurchases < ActiveRecord::Migration
  def change
    create_table :stock_purchases do |t|
      t.references :person, index: true
      t.references :stock, index: true
      t.references :stock_purchase_type, index: true
      t.references :stock_award, index: true
      t.date :grant_date
      t.decimal :grant_date_price
      t.integer :shares
      t.date :acquired_date
      t.decimal :acquired_price
      t.decimal :acquired_fmv

      t.timestamps
    end
  end
end
