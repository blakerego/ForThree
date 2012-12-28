class DropWeeksTable < ActiveRecord::Migration
  def up
  	drop_table :weeks
  end

  def down
  	  create_table :weeks do |t|
      t.integer :number

      t.timestamps
  	end
  end
end
