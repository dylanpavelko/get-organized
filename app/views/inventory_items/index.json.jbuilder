json.array!(@inventory_items) do |inventory_item|
  json.extract! inventory_item, :id, :name, :amount, :quantity_type_id, :consumable, :price, :purchase_date, :note, :detail, :brand
  json.url inventory_item_url(inventory_item, format: :json)
end
