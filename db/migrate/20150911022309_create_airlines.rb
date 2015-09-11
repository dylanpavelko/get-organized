class CreateAirlines < ActiveRecord::Migration
  def change
    create_table :airlines do |t|
      t.string :name
      t.references :loyalty_program, index: true
      t.string :image

      t.timestamps
    end
  end
end
