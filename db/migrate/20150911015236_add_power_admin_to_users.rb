class AddPowerAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :power_admin, :boolean
  end
end
