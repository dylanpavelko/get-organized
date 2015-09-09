class ItineraryActivity < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :basis
  belongs_to :trip

  def date
  	return self.datetime.strftime("%A - %b %d, %Y")
  end
end
