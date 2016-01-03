json.array!(@planning_aspects) do |planning_aspect|
  json.extract! planning_aspect, :id, :name, :description
  json.url planning_aspect_url(planning_aspect, format: :json)
end
