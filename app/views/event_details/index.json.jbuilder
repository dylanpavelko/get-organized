json.array!(@event_details) do |event_detail|
  json.extract! event_detail, :id, :name
  json.url event_detail_url(event_detail, format: :json)
end
