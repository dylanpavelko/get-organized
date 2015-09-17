class Task < ActiveRecord::Base
  belongs_to :security_domain

  validates :security_domain_id, :presence => true

  def matches(search_string)
    @search_pieces = search_string.split(' ')
    @search_pieces.each do |word|
      if !self.task_name.downcase.include? word.downcase
        return false
      end
    end
    return true
  end
  
  def user_has_access(user)
    user.roles.each do |role|
      if role.has_security_domain_for_task(self)
        return true
      end
    end
    return false
  end
end
