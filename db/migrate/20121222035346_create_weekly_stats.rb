class CreateWeeklyStats < ActiveRecord::Migration
  def change
    create_table :weekly_stats do |t|
      t.integer :team_id
      t.integer :week_number
      t.float :field_goal_percentage
      t.float :free_throw_percentage
      t.integer :three_pointers_made
      t.integer :rebounds
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers

      t.timestamps
    end
  end
end
