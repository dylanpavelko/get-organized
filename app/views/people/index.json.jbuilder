json.array!(@people) do |person|
  json.extract! person, :id, :first_name, :nick_name, :last_name, :user_account_id
  json.url person_url(person, format: :json)
end
