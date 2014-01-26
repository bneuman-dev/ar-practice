#require_relative 'list_owner'

class Group < ListViewer
  # Remember to create a migration!
  has_many :user_groups
  has_many :users, through: :user_groups, class_name: "User"
  has_many :admins, -> { where "access_level > 3" }, through: :user_groups, source: :user
  after_save :post_save

  def post_save
    creator = self.users.first
    if creator
      self.update(creator: creator) 
      relation = self.user_groups.find_by(user: creator)
      relation.update(access_level: 4)
    end
  end

  def make_admin(user)
    relation = self.user_groups.find_by(user: user)
    if relation
      relation.update(access_level: 4)
    end
  end
end
