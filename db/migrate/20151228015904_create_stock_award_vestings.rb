class CreateStockAwardVestings < ActiveRecord::Migration
  def change
    create_table :stock_award_vestings do |t|
      t.references :stock_award, index: true
      t.date :vest_date
      t.integer :vest_quantity

      t.timestamps
    end
  end
end
