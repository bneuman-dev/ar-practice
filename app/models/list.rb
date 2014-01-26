class List < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :list_task_joins
  has_many :tasks, through: :list_task_joins
  has_many :list_permissions
  has_many :readers, -> { where "permission = 1" }, through: :list_permissions, source: :user
  has_many :writers, -> { where "permission = 2" }, through: :list_permissions, source: :user
  # validates :task, uniqueness: true
  # Remember to create a migration!

  def create_task(params)
    self.tasks.create(params)
  end
end
