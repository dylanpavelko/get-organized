class EventActivityHasAgendaItem < ActiveRecord::Base
  belongs_to :event_activity
  belongs_to :event_agenda_item
end
