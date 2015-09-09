class CreateExerciseCenters < ActiveRecord::Migration
  def change
    create_table :exercise_centers do |t|
      t.string :gymType
      t.string :name
      t.string :site
      t.text :notes

      t.timestamps
    end
  end
end
