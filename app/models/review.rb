class Review < ActiveRecord::Base
  belongs_to :comment
  belongs_to :reviewer, class_name: "Person", foreign_key: ":reviewer_id"
  
  def get_reviewer
    return Person.where(:id => self.reviewer_id).first
  end
  
  def public_designation
    return self.public
  end
end
