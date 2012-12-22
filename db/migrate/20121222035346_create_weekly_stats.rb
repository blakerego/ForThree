class CreateWeeklyStats < ActiveRecord::Migration
  def change
    create_table :weekly_stats do |t|
      t.integer :team_id
      t.integer :week_number
      t.double :fg%
      t.double :ft%
      t.integer :3ptm
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers

      t.timestamps
    end
  end
end
