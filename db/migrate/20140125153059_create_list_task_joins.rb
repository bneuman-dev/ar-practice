class CreateListTaskJoins< ActiveRecord::Migration
  def change
    create_join_table :lists, :tasks, table_name: :list_task_joins
  end
end
