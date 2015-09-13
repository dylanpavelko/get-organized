json.array!(@inventory_owners) do |inventory_owner|
  json.extract! inventory_owner, :id, :inventory_item_id, :amount, :quantity_type_id, :person_id
  json.url inventory_owner_url(inventory_owner, format: :json)
end
