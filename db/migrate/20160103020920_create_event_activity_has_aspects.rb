class CreateEventActivityHasAspects < ActiveRecord::Migration
  def change
    create_table :event_activity_has_aspects do |t|
      t.references :event_activity, index: true
      t.references :planning_aspect, index: true

      t.timestamps
    end
  end
end
