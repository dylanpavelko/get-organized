class EventAspectHasEventDetail < ActiveRecord::Base
  belongs_to :activity_aspect
  belongs_to :event_detail
end
