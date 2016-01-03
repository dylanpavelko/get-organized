json.array!(@event_template_has_aspects) do |event_template_has_aspect|
  json.extract! event_template_has_aspect, :id, :event_id, :planning_aspect_id
  json.url event_template_has_aspect_url(event_template_has_aspect, format: :json)
end
