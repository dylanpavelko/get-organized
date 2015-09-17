json.array!(@security_domain_has_roles) do |security_domain_has_role|
  json.extract! security_domain_has_role, :id, :domain_id, :role_id
  json.url security_domain_has_role_url(security_domain_has_role, format: :json)
end
