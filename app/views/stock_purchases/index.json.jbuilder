json.array!(@stock_purchases) do |stock_purchase|
  json.extract! stock_purchase, :id, :person_id, :stock_id, :stock_purchase_type_id, :stock_award_id, :grant_date, :grant_date_price, :shares, :acquired_date, :acquired_price, :acquired_fmv
  json.url stock_purchase_url(stock_purchase, format: :json)
end
