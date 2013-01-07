class AddWeeksidToTeams < ActiveRecord::Migration
    def up
  	add_column :teams, :week_id, :integer
  end

  def down
  	remove_column :teams, :week_id
  end
end
