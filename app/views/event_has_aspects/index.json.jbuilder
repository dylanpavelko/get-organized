json.array!(@event_has_aspects) do |event_has_aspect|
  json.extract! event_has_aspect, :id, :event_id, :planning_aspect_id
  json.url event_has_aspect_url(event_has_aspect, format: :json)
end
