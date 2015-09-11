json.array!(@airlines) do |airline|
  json.extract! airline, :id, :name, :loyalty_program_id, :image
  json.url airline_url(airline, format: :json)
end
