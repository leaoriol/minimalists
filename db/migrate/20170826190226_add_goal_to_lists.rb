class AddGoalToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :goal, :int
  end
end
