class CreateListPermissions < ActiveRecord::Migration
  def change
    create_table :list_permissions do |t|
      t.integer :list_viewer_id
      t.integer :list_id
      t.integer :permission
    end
  end
end