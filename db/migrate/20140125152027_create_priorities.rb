class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priority_levels do |t|
      t.string :level
    end
  end
end
