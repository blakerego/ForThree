class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :mpg
      t.float :fg_pct
      t.float :ft_pct
      t.float :threes
      t.float :points
      t.float :rebounds
      t.float :assists
      t.float :steals
      t.float :blocks
      t.float :TO
    end
  end
end
