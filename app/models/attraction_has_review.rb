class AttractionHasReview < ActiveRecord::Base
  belongs_to :attraction, class_name: "Attraction", foreign_key: "attraction_id"
  belongs_to :review
end
