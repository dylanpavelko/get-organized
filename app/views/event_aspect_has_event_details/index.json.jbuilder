json.array!(@event_aspect_has_event_details) do |event_aspect_has_event_detail|
  json.extract! event_aspect_has_event_detail, :id, :activity_aspect_id, :event_detail_id
  json.url event_aspect_has_event_detail_url(event_aspect_has_event_detail, format: :json)
end
