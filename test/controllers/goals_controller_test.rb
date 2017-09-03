require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers

  setup do
    @goal = goals(:one)
    @list = lists(:one)
    @user = users(:one)
  end

  test "should get index" do
    sign_in @user
    get goals_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get new_goal_url
    assert_response :success
  end

  test "should create goal" do
    sign_in @user
    assert_difference('Goal.count') do
      post goals_url, params: { goal: { overall_goal: @goal.overall_goal, user_id: @goal.user_id } }
    end
    assert_redirected_to goals_url
    # assert_redirected_to goal_url(Goal.last)
  end

  test "should show goal" do
    sign_in @user
    get goal_url(@goal)
    assert_response :success
  end

  # edit goal is taken care of via ajax calls 
  # test "should get edit" do
  #   get edit_goal_url(@goal)
  #   assert_response :success
  # end

  test "should update goal" do
    sign_in @user
    patch goal_url(@goal), params: { goal: { overall_goal: @goal.overall_goal, user_id: @goal.user_id } }
    assert_redirected_to goal_url(@goal)
  end

  test "should destroy goal" do
    sign_in @user
    assert_difference('Goal.count', -1) do
      delete goal_url(@goal)
    end

    assert_redirected_to goals_url
  end
end
