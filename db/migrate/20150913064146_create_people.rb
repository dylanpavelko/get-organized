class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :nick_name
      t.string :last_name
      t.references :user_account, index: true

      t.timestamps
    end
  end
end
