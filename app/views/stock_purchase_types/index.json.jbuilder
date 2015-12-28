json.array!(@stock_purchase_types) do |stock_purchase_type|
  json.extract! stock_purchase_type, :id, :name
  json.url stock_purchase_type_url(stock_purchase_type, format: :json)
end
