class CreateEventHasAspects < ActiveRecord::Migration
  def change
    create_table :event_has_aspects do |t|
      t.references :event, index: true
      t.references :planning_aspect, index: true

      t.timestamps
    end
  end
end
