class CreateStockAwardTypes < ActiveRecord::Migration
  def change
    create_table :stock_award_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
