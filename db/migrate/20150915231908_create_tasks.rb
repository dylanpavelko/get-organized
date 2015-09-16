class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_path
      t.references :security_domain, index: true

      t.timestamps
    end
  end
end
