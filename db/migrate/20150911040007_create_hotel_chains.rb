class CreateHotelChains < ActiveRecord::Migration
  def change
    create_table :hotel_chains do |t|
      t.string :name
      t.references :loyalty_program, index: true
      t.string :image

      t.timestamps
    end
  end
end
