# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  goal       :integer
#

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:one)
    @list = List.create(name: "test", user_id: @user.id)
    # @list = @user.create_list(name: "test")
    #build creates the record but does not save it in the DB
  end

  test "should be valid" do
    assert @list.valid?
  end

  test "user_id should be present" do
    @list.user_id = nil
    assert_not @list.valid?
  end

  test "list_name should be present" do
    @list.name = nil
    assert_not @list.valid?
  end

  test "associated items should be destroyed" do
    @list.save
    @list.items.create!(name: "test", list_id: @list.id, quantity: 1, action: 'unsure')
    assert_difference 'Item.count', -1 do
      @list.destroy
    end
  end

end
