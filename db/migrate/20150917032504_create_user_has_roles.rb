class CreateUserHasRoles < ActiveRecord::Migration
  def change
    create_table :user_has_roles do |t|
      t.references :user, index: true
      t.references :role, index: true

      t.timestamps
    end
  end
end
