class Week < ActiveRecord::Base
	has_many :WeeklyStats
  attr_accessible :number
end
