class AddCategoryAndSubCategoryToInventoryItems < ActiveRecord::Migration
  def change
    add_reference :inventory_items, :category, index: true
    add_reference :inventory_items, :subcategory, index: true
  end
end
