json.array!(@activity_has_exercise_centers) do |activity_has_exercise_center|
  json.extract! activity_has_exercise_center, :id, :activity_id, :exercise_center_id
  json.url activity_has_exercise_center_url(activity_has_exercise_center, format: :json)
end
