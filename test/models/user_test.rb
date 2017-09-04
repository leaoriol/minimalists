# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  name                   :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "test", email: "user@example.com", password: "test1234")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "email should be present" do
    @user.email = ''
    assert_not @user.valid?
  end

  test "associated list should be destroyed" do 
    @user.save
    @list = List.create(name: "test", user_id: @user.id)
    # @user.create_list(name: "test")
    assert_difference 'List.count', -1 do
      @user.destroy
    end
  end

  test 'associated goals should be destroyed' do
    @user.save
    @goal = Goal.create(overall_goal: 0, user_id: @user.id)
    assert_difference 'Goal.count', -1 do
      @user.destroy 
    end
  end

end
