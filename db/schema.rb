# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130102005235) do

  create_table "matchups", :force => true do |t|
    t.integer "week_number"
    t.integer "team1_id"
    t.integer "team2_id"
  end

  create_table "players", :force => true do |t|
    t.string  "name"
    t.string  "position"
    t.integer "mpg"
    t.float   "fg_pct"
    t.float   "ft_pct"
    t.float   "threes"
    t.float   "points"
    t.float   "rebounds"
    t.float   "assists"
    t.float   "steals"
    t.float   "blocks"
    t.float   "TO"
  end

  create_table "teams", :force => true do |t|
    t.string  "name"
    t.integer "point_guard_id"
    t.integer "shooting_guard_id"
    t.integer "guard_id"
    t.integer "power_forward_id"
    t.integer "small_forward_id"
    t.integer "forward_id"
    t.integer "center1_id"
    t.integer "center2_id"
    t.integer "util1_id"
    t.integer "util2_id"
    t.integer "bench1_id"
    t.integer "bench2_id"
    t.integer "bench3_id"
    t.integer "week_number"
  end

  create_table "weekly_stats", :force => true do |t|
    t.integer "team_id"
    t.integer "week_number"
    t.float   "field_goal_percentage"
    t.float   "free_throw_percentage"
    t.integer "three_pointers_made"
    t.integer "rebounds"
    t.integer "assists"
    t.integer "steals"
    t.integer "blocks"
    t.integer "turnovers"
    t.integer "total_points"
  end

end
