class Task < ActiveRecord::Base
  belongs_to :security_domain

  def matches(search_string)
    @search_pieces = search_string.split(' ')
    @search_pieces.each do |word|
      if !self.task_name.downcase.include? word.downcase
        return false
      end
    end
    return true
  end
end
