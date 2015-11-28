class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :recipe, index: true
      t.string :amount
      t.references :quantity_type, index: true
      t.references :food_item, index: true

      t.timestamps
    end
  end
end
