json.array!(@event_agenda_items) do |event_agenda_item|
  json.extract! event_agenda_item, :id, :name
  json.url event_agenda_item_url(event_agenda_item, format: :json)
end
