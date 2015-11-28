class Recipe < ActiveRecord::Base
  belongs_to :author
  has_many :ingredients, class_name: "RecipeIngredient"
  accepts_nested_attributes_for :ingredients, :allow_destroy => true
end
