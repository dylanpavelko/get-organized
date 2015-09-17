json.array!(@user_has_roles) do |user_has_role|
  json.extract! user_has_role, :id, :user_id, :role_id
  json.url user_has_role_url(user_has_role, format: :json)
end
