class CreateActivityAspectHasEventDetails < ActiveRecord::Migration
  def change
    create_table :activity_aspect_has_event_details do |t|
      t.references :activity_aspect, index: true
      t.references :event_detail, index: true

      t.timestamps
    end
  end
end
