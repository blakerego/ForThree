class Player < ActiveRecord::Base
	belongs_to :teams
  attr_accessible :TO, :assists, :blocks, :fg_pct, :ft_pct, :mpg, :name, :points, :position, :rebounds, :steals, :threes
end
