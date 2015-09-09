class Location < ActiveRecord::Base
  belongs_to :timezonen

  def display_name
  	if self.name != ''
  		return name
  	else
  		return self.city + ", " + self.state
  	end
  end
end
