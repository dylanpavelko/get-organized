class Person < ActiveRecord::Base
  belongs_to :user_account, class_name: "User", foreign_key: "user_account_id"
end
