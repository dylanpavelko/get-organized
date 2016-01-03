class PlanningAspect < ActiveRecord::Base
	belongs_to :event_type, class_name: "EventType", foreign_key: "event_type_id"
	belongs_to :event_activity, class_name: "EventType", foreign_key: "event_activity_id"
end
