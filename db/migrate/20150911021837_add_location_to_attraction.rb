class AddLocationToAttraction < ActiveRecord::Migration
  def change
    add_reference :attractions, :location, index: true
  end
end
