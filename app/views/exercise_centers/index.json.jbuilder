json.array!(@exercise_centers) do |exercise_center|
  json.extract! exercise_center, :id, :gymType, :name, :site, :notes
  json.url exercise_center_url(exercise_center, format: :json)
end
