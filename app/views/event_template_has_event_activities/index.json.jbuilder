json.array!(@event_template_has_event_activities) do |event_template_has_event_activity|
  json.extract! event_template_has_event_activity, :id, :event_id, :activities_id
  json.url event_template_has_event_activity_url(event_template_has_event_activity, format: :json)
end
