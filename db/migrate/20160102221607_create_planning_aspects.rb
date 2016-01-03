class CreatePlanningAspects < ActiveRecord::Migration
  def change
    create_table :planning_aspects do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
