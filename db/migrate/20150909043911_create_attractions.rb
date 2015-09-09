class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.references :attraction_category, index: true
      t.string :name

      t.timestamps
    end
  end
end
