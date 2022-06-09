class ChangeDatatypeAlldayOfTasks < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :allday, :boolean
  end
end
