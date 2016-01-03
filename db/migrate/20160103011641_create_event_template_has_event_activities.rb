class CreateEventTemplateHasEventActivities < ActiveRecord::Migration
  def change
    create_table :event_template_has_event_activities do |t|
      t.references :event, index: true
      t.references :activities, index: true

      t.timestamps
    end
  end
end
