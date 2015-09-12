class Trip < ActiveRecord::Base
  belongs_to :itinerary_item
  has_many :itinerary_activities

  def first_date
  	@activities = ItineraryActivity.where(:trip_id => self.id).order(:datetime)
    @activities = @activities.reject {|x| x.datetime == nil}
  	if @activities.count > 0 
  		return @activities.first.date
  	else
  		return ''
  	end
  end

  def last_date
  	@activities = ItineraryActivity.where(:trip_id => self.id).order(:datetime)
    @activities = @activities.reject {|x| x.datetime == nil}
  	if @activities.count > 0 
  		return @activities.last.date
  	else
  		return ''
  	end
  end
end
