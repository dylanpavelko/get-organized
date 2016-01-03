class CreateEventAgendaItems < ActiveRecord::Migration
  def change
    create_table :event_agenda_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
