require 'test_helper'

class Xkcd1930ControllerTest < ActionDispatch::IntegrationTest
  test "should get calendar" do
    get xkcd1930_calendar_url
    assert_response :success
  end

end
