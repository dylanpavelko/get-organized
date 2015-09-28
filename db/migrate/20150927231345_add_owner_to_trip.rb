class AddOwnerToTrip < ActiveRecord::Migration
  def change
    add_reference :trips, :owner
  end
end
