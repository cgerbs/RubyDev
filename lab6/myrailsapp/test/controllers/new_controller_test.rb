require 'test_helper'

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get new_home_url
    assert_response :success
  end

  test "should get page1" do
    get new_page1_url
    assert_response :success
  end

  test "should get page2" do
    get new_page2_url
    assert_response :success
  end

end
