class Comment < ActiveRecord::Base
  belongs_to :reply_to
  belongs_to :author, class_name: "Person", foreign_key: ":author_id"
  
  def get_author
    return Person.where(:id => self.author_id).first
  end
end
