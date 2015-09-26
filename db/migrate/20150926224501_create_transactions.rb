class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :inventory_item, index: true
      t.references :buyer_person, index: true
      t.references :seller_business, index: true
      t.decimal :price
      t.date :transaction_date
      t.decimal :amount
      t.references :quantity_type, index: true
      t.boolean :shopping_list

      t.timestamps
    end
  end
end
