class Task < ActiveRecord::Base
  belongs_to :priority_level, foreign_key: :priority_id
  belongs_to :creator, class_name: "User"
  has_many :list_task_joins
  has_many :lists, through: :list_task_joins

  # Remember to create a migration!
end