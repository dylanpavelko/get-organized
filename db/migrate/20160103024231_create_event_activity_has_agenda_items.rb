class CreateEventActivityHasAgendaItems < ActiveRecord::Migration
  def change
    create_table :event_activity_has_agenda_items do |t|
      t.references :event_activity, index: true
      t.references :event_agenda_item, index: true

      t.timestamps
    end
  end
end
