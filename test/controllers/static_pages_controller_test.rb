require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_response :success 
    assert_select "title", "MinimaList"
  end

  test "should get learn_more" do
    get learn_more_path
    assert_response :success # verifies that the route is happening correctly via assertion where success = 200 OK
    assert_select "title", "Learn More"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact"
  end

end
