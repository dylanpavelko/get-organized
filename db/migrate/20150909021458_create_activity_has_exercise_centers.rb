class CreateActivityHasExerciseCenters < ActiveRecord::Migration
  def change
    create_table :activity_has_exercise_centers do |t|
      t.references :activity, index: true
      t.references :exercise_center, index: true

      t.timestamps
    end
  end
end
