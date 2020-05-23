require 'test_helper'

class NewhomeControllerTest < ActionDispatch::IntegrationTest
  test "should get page1" do
    get newhome_page1_url
    assert_response :success
  end

  test "should get page2" do
    get newhome_page2_url
    assert_response :success
  end

end
