class EventHasAspect < ActiveRecord::Base
  belongs_to :event
  belongs_to :planning_aspect
end
