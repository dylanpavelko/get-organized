class EventTemplateHasAspect < ActiveRecord::Base
  belongs_to :event_template, class_name: "EventTemplate", foreign_key: "event_id"
  belongs_to :planning_aspect
end
