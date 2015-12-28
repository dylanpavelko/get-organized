json.array!(@stocks) do |stock|
  json.extract! stock, :id, :business_id, :symbol
  json.url stock_url(stock, format: :json)
end
