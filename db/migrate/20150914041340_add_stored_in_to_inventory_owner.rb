class AddStoredInToInventoryOwner < ActiveRecord::Migration
  def change
    add_reference :inventory_owners, :stored_in, index: true
  end
end
