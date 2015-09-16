json.array!(@task_has_security_domains) do |task_has_security_domain|
  json.extract! task_has_security_domain, :id, :task_id, :security_domain_id
  json.url task_has_security_domain_url(task_has_security_domain, format: :json)
end
