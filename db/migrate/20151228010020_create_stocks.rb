class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :business, index: true
      t.string :symbol

      t.timestamps
    end
  end
end
