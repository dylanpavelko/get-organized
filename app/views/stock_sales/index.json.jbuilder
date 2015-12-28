json.array!(@stock_sales) do |stock_sale|
  json.extract! stock_sale, :id, :person_id, :stock_id, :stock_purchase_id, :stock_award_id, :trade_date, :price, :shares, :fees
  json.url stock_sale_url(stock_sale, format: :json)
end
