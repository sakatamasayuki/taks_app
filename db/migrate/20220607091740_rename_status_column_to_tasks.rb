class RenameStatusColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :status, :memo
  end
end
