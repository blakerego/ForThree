class RemoveTs < ActiveRecord::Migration
  def up
  	remove_column :weekly_stats, :created_at
  	remove_column :weekly_stats, :updated_at
  	remove_column :teams, :created_at
  	remove_column :teams, :updated_at
  end

  def down
  	add_column :weekly_stats, :created_at, :datetime
  	add_column :weekly_stats, :updated_at, :datetime
  	add_column :teams, :created_at, :datetime
  	add_column :teams, :updated_at, :datetime
  end
end
