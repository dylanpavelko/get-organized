class Trip < ActiveRecord::Base
  belongs_to :itinerary_item
  has_many :itinerary_activities
  belongs_to :owner, class_name: "Person", foreign_key: "owner_id"
  
  def self.get_my_trips(current_user)
    mine = Array.new
    Trip.all.each do |trip|
      if trip.owner_id != nil
        if trip.owner_id == current_user.person_id or TripHasParticipant.where(:trip_id => trip.id, :participant_id => current_user.person_id).count > 0
          mine << trip
        end
      end
    end
    return mine
  end

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

  def matches(search_string)
    @search_pieces = search_string.split(' ')
    @search_pieces.each do |word|
      if !self.name.downcase.include? word.downcase
        return false
      end
    end
    return true
  end

end