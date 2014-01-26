class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  after_create :post_save

  def post_save
    if self.user == self.group.creator
      self.update(access_level: 4)
    elsif self.access_level.nil?
      self.update(access_level: 1)
    end
  end
  # Remember to create a migration!
end
