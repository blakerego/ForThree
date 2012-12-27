class AddPositionsToTeams < ActiveRecord::Migration
  def up
  	add_column :teams, :point_guard_id, :integer
  	add_column :teams, :shooting_guard_id, :integer
  	add_column :teams, :guard_id, :integer
  	add_column :teams, :power_forward_id, :integer
  	add_column :teams, :small_forward_id, :integer
  	add_column :teams, :forward_id, :integer
  	add_column :teams, :center1_id, :integer
  	add_column :teams, :center2_id, :integer
  	add_column :teams, :util1_id, :integer
  	add_column :teams, :util2_id, :integer
  	add_column :teams, :bench1_id, :integer
  	add_column :teams, :bench2_id, :integer
  	add_column :teams, :bench3_id, :integer
  end

  def down
  	remove_column :teams, :point_guard_id
  	remove_column :teams, :shooting_guard_id
  	remove_column :teams, :guard_id
  	remove_column :teams, :power_forward_id
  	remove_column :teams, :small_forward_id
  	remove_column :teams, :forward_id
  	remove_column :teams, :center1_id
  	remove_column :teams, :center2_id
  	remove_column :teams, :util1_id
  	remove_column :teams, :util2_id
  	remove_column :teams, :bench1_id
  	remove_column :teams, :bench2_id
  	remove_column :teams, :bench3_id
  end
end
