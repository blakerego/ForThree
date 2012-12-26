class DropWeeksTable < ActiveRecord::Migration
  def up
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
