json.array!(@event_templates) do |event_template|
  json.extract! event_template, :id, :name, :event_type_id
  json.url event_template_url(event_template, format: :json)
end
