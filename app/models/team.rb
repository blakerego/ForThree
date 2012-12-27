class Team < ActiveRecord::Base
	has_many :weekly_stats
	has_many :players
  attr_accessible :name
end
