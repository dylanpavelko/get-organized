json.array!(@event_activities) do |event_activity|
  json.extract! event_activity, :id, :name
  json.url event_activity_url(event_activity, format: :json)
end
