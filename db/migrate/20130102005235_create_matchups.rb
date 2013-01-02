class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
    	t.integer :week_number
    	t.integer :team1_id
    	t.integer :team2_id
    end
  end
end
