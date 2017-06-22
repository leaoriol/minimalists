require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  # test for contact layout
  test "landing links"  do
    get contact_path
    assert_template 'static_pages/contact'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", learn_more_path
    assert_select "a[href=?]", contact_path
    get root_path
    assert_template 'static_pages/landing'
    # add more complex root layout testing when ready
  end
end
