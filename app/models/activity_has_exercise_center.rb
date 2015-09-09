class ActivityHasExerciseCenter < ActiveRecord::Base
  belongs_to :activity
  belongs_to :exercise_center
end
