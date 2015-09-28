class CreateTripHasParticipants < ActiveRecord::Migration
  def change
    create_table :trip_has_participants do |t|
      t.references :trip, index: true
      t.references :participant, index: true
      t.boolean :organizer
      t.boolean :private_viewer
      t.boolean :traveler

      t.timestamps
    end
  end
end
