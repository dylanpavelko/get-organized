class CreateQuantityTypes < ActiveRecord::Migration
  def change
    create_table :quantity_types do |t|
      t.string :quantityType

      t.timestamps
    end
  end
end
