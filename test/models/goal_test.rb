require 'test_helper'

class GoalTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
    @goal = Goal.new(overall_goal: 1, user_id: @user.id)
  end

  test 'should be valid' do
    assert @goal.valid?
  end

  test 'overall goal should be present' do
    @goal.overall_goal = ''
    assert_not @goal.valid?
  end

end
