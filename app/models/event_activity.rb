class EventActivity < ActiveRecord::Base

	def planning_aspects
		@aspects = EventActivityHasAspect.where(:event_activity => self.id)
	end
end
