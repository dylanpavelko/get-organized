json.array!(@event_activity_has_agenda_items) do |event_activity_has_agenda_item|
  json.extract! event_activity_has_agenda_item, :id, :event_activity_id, :event_agenda_item_id
  json.url event_activity_has_agenda_item_url(event_activity_has_agenda_item, format: :json)
end
