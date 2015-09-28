class SecurityDomain < ActiveRecord::Base

	def tasks
		return Task.where(:security_domain_id => self.id)
	end

	def roles
		@domain_has_roles = SecurityDomainHasRole.where(:domain_id => self.id)
		@roles = Array.new
		@domain_has_roles.each do |dhr|
			@roles << dhr.role
		end
		return @roles
	end
end
