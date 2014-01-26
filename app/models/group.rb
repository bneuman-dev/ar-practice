require_relative 'list_viewer'

class Group < ListViewer
  # Remember to create a migration!
  belongs_to :creator, class_name: "User"
  has_many :user_groups
  has_many :users, through: :user_groups, class_name: "User"
  has_many :admins, -> { where "access_level > 3" }, through: :user_groups, source: :user

  def make_admin(user)
    relation = self.user_groups.find_by(user: user)
    if relation
      relation.update(access_level: 4)
    end
  end
end
