require_relative 'list_permissions'

class User < ActiveRecord::Base
  has_many :list_permissions
  has_many :lists, through: :list_permissions
  has_many :read_only_lists, -> { where "permission = 1" }, through: :list_permissions, source: :list 
  has_many :tasks, foreign_key: "creator_id"
  has_many :created_lists, class_name: "List", foreign_key: :creator_id


  def create_list(name)
    self.lists.create(name: name, creator: self)
  end

  def add_list(list)
    self.lists << list
  end

  def create_task(params)
    self.tasks.create(params)
  end

  def create_task_for_list(list, params)
    list.tasks << create_task(params)
  end

  def make_list_readable_for_user(list, user)
    ListPermission.create(list: list, user: user, permission: 1)
  end

  def make_list_writeable_for_user(list, user)
    list = ListPermission.where(list: list, user: user).first_or_create
    list.update(permission: 2)
  end
  # Remember to create a migration!
end
