class EventActivityHasAspect < ActiveRecord::Base
  belongs_to :event_activity
  belongs_to :planning_aspect
end
