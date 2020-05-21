class RemoveSubtaskFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :subtask, :string
  end
end
