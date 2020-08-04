require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get users" do
    get search_users_url
    assert_response :success
  end

end
