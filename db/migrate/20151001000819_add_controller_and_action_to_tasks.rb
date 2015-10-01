class AddControllerAndActionToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :controller, :string
    add_column :tasks, :action, :string
  end
end
