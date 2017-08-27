require 'test_helper'

class ListLayoutTest < ActionDispatch::IntegrationTest
  include ApplicationHelper
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @list = lists(:one)
  end

  test "list page displays correctly" do
    sign_in @user
    get list_path(@list)
    # assert_template 'lists/#{@list.id}'
    assert_match @list.items.count.to_s, response.body
    assert_select 'div.pagination'
    @list.items.paginate(page: 1).each do |item|
      assert_match item.name, response.body
    end
  end
end
