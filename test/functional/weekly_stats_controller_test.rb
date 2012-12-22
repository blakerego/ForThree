require 'test_helper'

class WeeklyStatsControllerTest < ActionController::TestCase
  setup do
    @weekly_stat = weekly_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weekly_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weekly_stat" do
    assert_difference('WeeklyStat.count') do
      post :create, weekly_stat: { blocks: @weekly_stat.blocks, field_goal_percentage: @weekly_stat.field_goal_percentage, free_throw_percentage: @weekly_stat.free_throw_percentage, rebounds: @weekly_stat.rebounds, steals: @weekly_stat.steals, team_id: @weekly_stat.team_id, three_pointers_made: @weekly_stat.three_pointers_made, turnovers: @weekly_stat.turnovers, week_number: @weekly_stat.week_number }
    end

    assert_redirected_to weekly_stat_path(assigns(:weekly_stat))
  end

  test "should show weekly_stat" do
    get :show, id: @weekly_stat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weekly_stat
    assert_response :success
  end

  test "should update weekly_stat" do
    put :update, id: @weekly_stat, weekly_stat: { blocks: @weekly_stat.blocks, field_goal_percentage: @weekly_stat.field_goal_percentage, free_throw_percentage: @weekly_stat.free_throw_percentage, rebounds: @weekly_stat.rebounds, steals: @weekly_stat.steals, team_id: @weekly_stat.team_id, three_pointers_made: @weekly_stat.three_pointers_made, turnovers: @weekly_stat.turnovers, week_number: @weekly_stat.week_number }
    assert_redirected_to weekly_stat_path(assigns(:weekly_stat))
  end

  test "should destroy weekly_stat" do
    assert_difference('WeeklyStat.count', -1) do
      delete :destroy, id: @weekly_stat
    end

    assert_redirected_to weekly_stats_path
  end
end
