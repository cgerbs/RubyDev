class AddSubtaskToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :subtask, :string
  end
end
