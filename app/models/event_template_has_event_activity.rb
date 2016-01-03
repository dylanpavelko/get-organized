class EventTemplateHasEventActivity < ActiveRecord::Base
  belongs_to :event_template, class_name: "EventTemplate", foreign_key: "event_id"
  belongs_to :activity, class_name: "EventActivity", foreign_key: "activities_id"
end
