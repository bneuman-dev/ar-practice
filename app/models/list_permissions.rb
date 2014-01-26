class ListPermission < ActiveRecord::Base
  belongs_to :user
  belongs_to :list
  validates :user, uniqueness: { scope: :list }
  after_create :post_create

  def post_create
    self.update(permission: 2) if self.user == self.list.creator
  end

  # Remember to create a migration!
end