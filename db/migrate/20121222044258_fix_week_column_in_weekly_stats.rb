class FixWeekColumnInWeeklyStats < ActiveRecord::Migration
  def up
  	rename_column :weekly_stats, :week_number, :week_id
  end

  def down
  end
end
