json.array!(@attraction_has_reviews) do |attraction_has_review|
  json.extract! attraction_has_review, :id, :attraction_id, :review_id
  json.url attraction_has_review_url(attraction_has_review, format: :json)
end
