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
    @user.create_list(name: "test")
    assert_difference 'List.count', -1 do
      @user.destroy
    end
  end

end
