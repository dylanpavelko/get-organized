class ItineraryActivity < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :basis
  belongs_to :trip
  belongs_to :origination
  belongs_to :destination
  belongs_to :airline

  validates :trip_id, :presence => true

  def date
    return self.datetime.to_date
  end
  
  def date_string
  	return self.datetime.try(:strftime, "%A - %b %d, %Y")
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

  def pair
    if self.end != nil
      return "pair"
    end
  end

  def origination
  	Location.where(:id => self.origination_id).first.display_name
  end

  def destination
  	Location.where(:id => self.destination_id).first.display_name
  end

  def get_itinerary_rows()
    @row = Array.new()
    if self.datetime !=nil
      @row << ItineraryRow.new(:activity => self, 
        :start => true, 
        :datetime => self.datetime, 
        :attraction => self.attraction, 
        :location => self.origination_id, 
        :name => self.name,
        :airline => self.airline,
        :pair => self.pair)
    end
    if self.end !=nil
      @row << ItineraryRow.new(:activity => self, 
        :start => false, 
        :datetime => self.end, 
        :attraction => self.attraction, 
        :location => self.destination_id, 
        :name => self.name,
        :airline => self.airline,
        :pair => "end")
    end
    return @row
  end

end

class ItineraryRow

  attr_accessor :datetime
  attr_accessor :attraction
  attr_accessor :location
  attr_accessor :name
  attr_accessor :start
  attr_accessor :activity
  attr_accessor :airline
  attr_accessor :pair

 def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def get_name
    if self.name == "" and self.attraction != nil and self.attraction.attraction_category == nil
      return self.attraction.name
    elsif self.name == "" and self.attraction != nil and self.start and self.attraction.hotel?
      return "Check-in at " + self.attraction.name
    elsif self.name == "" and self.attraction != nil and !self.start and self.attraction.hotel?
      return "Check-out of " + self.attraction.name
    elsif self.name == "" and self.location != nil and self.start
      return "Depart from " + Location.where(:id => self.location).first.display_name
    elsif self.name == "" and self.location != nil and !self.start
      return "Arrive at " + Location.where(:id => self.location).first.display_name
    elsif !self.start
      return self.name + " Ends"      
    else
      return name
    end
  end

  def date
    return self.datetime.try(:strftime, "%A - %b %d, %Y")
  end
end