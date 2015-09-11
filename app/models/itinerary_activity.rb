class ItineraryActivity < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :basis
  belongs_to :trip
  belongs_to :origination
  belongs_to :destination
  belongs_to :airline

  validates :trip_id, :presence => true

  def date
  	return self.datetime.strftime("%A - %b %d, %Y")
  end

  def get_name
  	if self.name == "" and self.attraction != nil
  		return self.attraction.name
  	elsif self.name == "" and self.origination != nil
  		return "Travel from " + self.origination + " to " + self.destination
  	else
  		return name
  	end
  end

  def origination
  	Location.where(:id => self.origination_id).first.display_name
  end

  def destination
  	Location.where(:id => self.destination_id).first.display_name
  end

end
