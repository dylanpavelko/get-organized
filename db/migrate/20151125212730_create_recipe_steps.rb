class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.references :recipe, index: true
      t.text :instruction
      t.integer :order

      t.timestamps
    end
  end
end
