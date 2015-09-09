class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.references :itinerary_item, index: true
      t.string :blog_link
      t.string :photo_link
      t.string :tripit_link

      t.timestamps
    end
  end
end
