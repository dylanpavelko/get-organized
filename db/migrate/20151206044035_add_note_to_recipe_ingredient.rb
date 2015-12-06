class AddNoteToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :note, :text
  end
end
