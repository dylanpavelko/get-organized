json.array!(@reviews) do |review|
  json.extract! review, :id, :rating, :comment_id, :reviewer_id, :public
  json.url review_url(review, format: :json)
end
