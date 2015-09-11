class CreateLoyaltyPrograms < ActiveRecord::Migration
  def change
    create_table :loyalty_programs do |t|
      t.string :name
      t.string :number
      t.string :username

      t.timestamps
    end
  end
end
