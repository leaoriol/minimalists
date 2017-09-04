# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  quantity   :integer
#  action     :string
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  
  def setup 
    @user = users(:one)
    @list = List.create(name: "test", user_id: @user.id)
    # @list = @user.create_list(name: "test")
    # create saves the object to the database, therefore list gets an id
    @item = @list.items.create(name: "item1", list_id: @list.id, quantity: 1, action: 'unsure')
  end

  test "item should be valid" do 
    assert @item.valid?
  end

  test "list_id should be present" do 
    @item.list_id = nil
    assert_not @item.valid?
  end

  test "quantity should be present" do
    @item.quantity = nil
    assert_not @item.valid?
  end

  test "action should be present" do
    @item.action = nil
    assert_not @item.valid?
  end

  test "get first create item first" do
    assert_equal @item, Item.first
  end
end
