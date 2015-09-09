class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.references :timezonen, index: true
      t.string :street_address
      t.string :street_address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
  end
end
