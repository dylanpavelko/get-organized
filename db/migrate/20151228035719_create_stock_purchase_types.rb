class CreateStockPurchaseTypes < ActiveRecord::Migration
  def change
    create_table :stock_purchase_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
