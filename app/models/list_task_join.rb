class ListTaskJoin < ActiveRecord::Base
  belongs_to :task
  belongs_to :list
  # Remember to create a migration!
end
