class RemoveDeadlineFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :deadline, :datetime
  end
end
