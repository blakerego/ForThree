class WeeklyStat < ActiveRecord::Base
  attr_accessible :three_pointers_made, :assists, :blocks, :field_goal_percentage, :free_throw_percentage, :rebounds, :steals, :team_id, :turnovers
end
