json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :inventory_item_id, :buyer_person_id, :seller_business_id, :price, :transaction_date, :amount, :quantity_type_id, :shopping_list
  json.url transaction_url(transaction, format: :json)
end
