json.array!(@stock_award_vestings) do |stock_award_vesting|
  json.extract! stock_award_vesting, :id, :stock_award_id, :vest_date, :vest_quantity
  json.url stock_award_vesting_url(stock_award_vesting, format: :json)
end
