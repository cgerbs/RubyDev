class AddChecklistToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :checklist, :string
  end
end
