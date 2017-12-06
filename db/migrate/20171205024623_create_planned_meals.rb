class CreatePlannedMeals < ActiveRecord::Migration
  def change
    create_table :planned_meals do |t|
      t.date :meal_date
      t.integer :meal_type
      t.string :text
      t.boolean :eat_out
      t.string :url
      t.references :recipe, index: true
      t.references :attraction, index: true
      t.boolean :left_overs
      t.references :planned_meal, index: true
      t.references :food_item, index: true
      t.text :comment
      t.integer :order

      t.timestamps
    end
  end
end
