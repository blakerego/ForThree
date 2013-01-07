class AddPointsToWeeklyStats < ActiveRecord::Migration
  def up
  	add_column :weekly_stats, :total_points, :integer
  end

  def down
  	remove_column :weekly_stats, :total_points
  end
end
