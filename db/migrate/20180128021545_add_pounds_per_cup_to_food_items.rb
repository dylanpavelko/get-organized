class AddPoundsPerCupToFoodItems < ActiveRecord::Migration
  def change
    add_column :food_items, :pounds_per_cup, :decimal
  end
end
