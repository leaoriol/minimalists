require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # test "should get root" do --> create this test when the root is set to home in routes.rb
  #   get static_pages_home_url
  #   assert_response :success 
  #   assert_select "title", "MinimaList"
  # end

  test "should get learn_more" do
    get static_pages_learn_more_url
    assert_response :success # verifies that the route is happening correctly via assertion where success = 200 OK
    assert_select "title", "Learn More"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact"
  end

end
