class ListPermission < ActiveRecord::Base
  belongs_to :list_viewer
  belongs_to :list
  validates :list_viewer, uniqueness: { scope: :list }
  after_create :post_create

  def post_create
    self.update(permission: 2) if self.list_viewer == self.list.creator
  end

  # Remember to create a migration!
end