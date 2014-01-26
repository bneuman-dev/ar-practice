class UserGroup < ActiveRecord::Base
  belongs_to :user, class_name: "ListViewer", foreign_key: :user_id
  belongs_to :group, class_name: "ListViewer", foreign_key: :group_id
  # Remember to create a migration!
end
