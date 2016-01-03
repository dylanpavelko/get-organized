json.array!(@activity_aspect_has_event_details) do |activity_aspect_has_event_detail|
  json.extract! activity_aspect_has_event_detail, :id, :activity_aspect_id, :event_detail_id
  json.url activity_aspect_has_event_detail_url(activity_aspect_has_event_detail, format: :json)
end
