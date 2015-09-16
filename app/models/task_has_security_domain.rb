class TaskHasSecurityDomain < ActiveRecord::Base
  belongs_to :task
  belongs_to :security_domain
end
