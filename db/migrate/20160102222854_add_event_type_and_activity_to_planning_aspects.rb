class AddEventTypeAndActivityToPlanningAspects < ActiveRecord::Migration
  def change
    add_reference :planning_aspects, :event_type, index: true
    add_reference :planning_aspects, :event_activity, index: true
  end
end
