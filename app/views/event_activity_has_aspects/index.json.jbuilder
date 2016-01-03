json.array!(@event_activity_has_aspects) do |event_activity_has_aspect|
  json.extract! event_activity_has_aspect, :id, :event_activity_id, :planning_aspect_id
  json.url event_activity_has_aspect_url(event_activity_has_aspect, format: :json)
end
