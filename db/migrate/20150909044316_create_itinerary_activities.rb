class CreateItineraryActivities < ActiveRecord::Migration
  def change
    create_table :itinerary_activities do |t|
      t.string :name
      t.references :attraction, index: true
      t.decimal :cost
      t.references :basis, index: true
      t.datetime :datetime
      t.integer :order

      t.timestamps
    end
  end
end
