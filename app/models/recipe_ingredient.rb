class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :quantity_type
  belongs_to :food_item
end
