class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :serving_size
      t.text :description
      t.string :source
      t.text :notes
      t.references :author, index: true

      t.timestamps
    end
  end
end
