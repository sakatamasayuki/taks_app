class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :begin
      t.datetime :end
      t.binary :allday

      t.timestamps
    end
  end
end
