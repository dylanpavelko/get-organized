class Recipe < ActiveRecord::Base
  belongs_to :author, class_name: "Person", foreign_key: "author_id"
  has_many :recipe_ingredient
  accepts_nested_attributes_for :recipe_ingredient, :allow_destroy => true
end
