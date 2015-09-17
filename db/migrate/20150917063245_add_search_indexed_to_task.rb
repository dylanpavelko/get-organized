class AddSearchIndexedToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :search_indexed, :boolean
  end
end
