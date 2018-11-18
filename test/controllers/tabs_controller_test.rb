require 'test_helper'

class TabsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get tabs_about_url
    assert_response :success
  end

  test "should get edit" do
    get tabs_edit_url
    assert_response :success
  end

end
