class WeeklyStats < ActiveRecord::Base
  attr_accessible :3ptm, :assists, :blocks, :fg%, :ft%, :rebounds, :steals, :team_id, :turnovers, :week_number
end
