class CreateAttractionCategories < ActiveRecord::Migration
  def change
    create_table :attraction_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
