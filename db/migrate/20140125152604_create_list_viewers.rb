class CreateListViewers < ActiveRecord::Migration
  def change
    create_table :list_viewers do |t|
      t.string :username
      t.string :type
      t.integer :creator_id
    end
  end
end
