class AddOwnerToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :owner, :reference
  end
end
