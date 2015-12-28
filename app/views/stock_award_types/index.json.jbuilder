json.array!(@stock_award_types) do |stock_award_type|
  json.extract! stock_award_type, :id, :name
  json.url stock_award_type_url(stock_award_type, format: :json)
end
