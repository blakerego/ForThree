class Team < ActiveRecord::Base
	has_many :weekly_stats
	has_many :players
  attr_accessible :name, :point_guard_id, :shooting_guard_id, :guard_id, :power_forward_id, :small_forward_id, :forward_id, :center1_id, :center2_id, :util1_id, :util2_id, :bench1_id, :bench2_id, :bench3_id
end