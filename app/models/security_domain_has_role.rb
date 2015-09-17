class SecurityDomainHasRole < ActiveRecord::Base
  belongs_to :domain, class_name: "SecurityDomain", foreign_key: "domain_id"
  belongs_to :role, class_name: "Role", foreign_key: "role_id"
end
