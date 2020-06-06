require 'test_helper'

class SuggestControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get suggest_get_url
    assert_response :success
  end

end
