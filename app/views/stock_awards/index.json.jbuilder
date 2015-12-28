json.array!(@stock_awards) do |stock_award|
  json.extract! stock_award, :id, :person_id, :stock_id, :award_type, :award_date, :shares
  json.url stock_award_url(stock_award, format: :json)
end
