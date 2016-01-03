class CreateEventTemplates < ActiveRecord::Migration
  def change
    create_table :event_templates do |t|
      t.string :name
      t.references :event_type, index: true

      t.timestamps
    end
  end
end
