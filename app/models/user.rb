require_relative 'list_permissions'
#require_relative 'list_owner'

class User < ListViewer
  has_many :user_groups
  has_many :groups, through: :user_groups, class_name: "Group"
  has_many :admin_groups, -> { where "access_level > 3" }, through: :user_groups, source: :group
  has_many :group_lists, through: :groups, source: :lists
  
  # def all_group_lists
  #   self.groups.reduce([]) { |group| group_lists(group) }
  # end

  def make_list_readable_for_viewer(list, viewer)
    ListPermission.create(list: list, list_viewer: viewer, permission: 1)
  end

  def make_list_writeable_for_viewer(list, viewer)
    list = ListPermission.where(list: list, list_viewer: viewer).first_or_create
    list.update(permission: 2)
  end
  # Remember to create a migration!
end
