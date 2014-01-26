class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :desc
      t.integer :priority_id
      t.integer :creator_id
      t.boolean :completed
      t.datetime :deadline
      t.timestamps
    end
  end
end