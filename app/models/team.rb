class Team < ActiveRecord::Base
	has_many :weekly_stats
	has_many :players
  attr_accessible :name
  attr_accessible  :point_guard_id
  attr_accessible  :shooting_guard_id
  attr_accessible  :guard_id
  attr_accessible  :power_forward_id
  attr_accessible  :small_forward_id
  attr_accessible  :forward_id
  attr_accessible  :center1_id
  attr_accessible  :center2_id
  attr_accessible  :util1_id
  attr_accessible  :util2_id
  attr_accessible  :bench1_id
  attr_accessible  :bench2_id
  attr_accessible  :bench3_id
  attr_accessible  :week_number

  validates :name, :uniqueness => true
end