require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get learn_more" do
    get static_pages_learn_more_url
    assert_response :success # verifies that the route is happening correctly via assertion where success = 200 OK
    assert_select "title", "Learn More"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help"
  end

end
