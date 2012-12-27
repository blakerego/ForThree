class RemoveWeekidFromWeeklyStats < ActiveRecord::Migration
  def up
  	remove_column :weekly_stats, :week_id
  end

  def down
  	add_column :weekly_stats, :week_id, :integer
  end
end
