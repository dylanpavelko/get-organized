class CreateEventActivities < ActiveRecord::Migration
  def change
    create_table :event_activities do |t|
      t.string :name

      t.timestamps
    end
  end
end
