class Role < ActiveRecord::Base
    def has_security_domain_for_task(task)
        @HasDomains = SecurityDomainHasRole.where(:role_id => self)
        @securityDomains = Array.new
        @HasDomains.each do |has|
            @securityDomains << has.domain
        end
        @securityDomains.each do |domain|
            if task.security_domain == domain
                return true
            end
        end
        return false
    end
end
