class WeeklyStat < ActiveRecord::Base
	belongs_to :team
  attr_accessible  :three_pointers_made
  attr_accessible  :assists
  attr_accessible  :blocks
  attr_accessible  :field_goal_percentage
  attr_accessible  :free_throw_percentage
  attr_accessible  :rebounds
  attr_accessible  :steals
  attr_accessible  :team_id
  attr_accessible  :week_number
  attr_accessible  :turnovers
  attr_accessible  :total_points

  validates :team_id, { :presence => true }  

  validates_uniqueness_of :week_number, :scope => :team_id
end
