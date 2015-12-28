class CreateStockAwards < ActiveRecord::Migration
  def change
    create_table :stock_awards do |t|
      t.references :person, index: true
      t.references :stock, index: true
      t.references :award_type
      t.date :award_date
      t.integer :shares

      t.timestamps
    end
  end
end
