require 'test_helper'

class MeetupControllerTest < ActionDispatch::IntegrationTest
  test "should get check" do
    get meetup_check_url
    assert_response :success
  end

  test "should get submit" do
    get meetup_submit_url
    assert_response :success
  end

end
