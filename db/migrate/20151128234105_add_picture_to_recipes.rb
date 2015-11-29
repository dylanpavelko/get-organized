class AddPictureToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :picture, index: true
  end
end
