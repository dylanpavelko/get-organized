json.array!(@hotel_chains) do |hotel_chain|
  json.extract! hotel_chain, :id, :name, :loyalty_program_id, :image
  json.url hotel_chain_url(hotel_chain, format: :json)
end
