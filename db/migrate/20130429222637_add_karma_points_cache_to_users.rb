class AddKarmaPointsCacheToUsers < ActiveRecord::Migration
  def up
    add_column :users, :karma_points_count, :integer, :default => 0
  end

  def down
    remove_column :users, :karma_points_count
  end
end


