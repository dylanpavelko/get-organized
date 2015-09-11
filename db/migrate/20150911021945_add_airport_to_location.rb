class AddAirportToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :airport, :boolean
  end
end
