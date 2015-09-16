json.array!(@tasks) do |task|
  json.extract! task, :id, :task_name, :task_path, :security_domain_id
  json.url task_url(task, format: :json)
end
