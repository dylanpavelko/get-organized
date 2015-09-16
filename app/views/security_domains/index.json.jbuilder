json.array!(@security_domains) do |security_domain|
  json.extract! security_domain, :id, :name
  json.url security_domain_url(security_domain, format: :json)
end
