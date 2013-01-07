class FixWeekNumberColumn < ActiveRecord::Migration
  def change
  	rename_column :teams, :week_id, :week_number
  	rename_column :weekly_stats, :week_id, :week_number
  end
end
