json.array!(@loyalty_programs) do |loyalty_program|
  json.extract! loyalty_program, :id, :name, :number, :username
  json.url loyalty_program_url(loyalty_program, format: :json)
end
