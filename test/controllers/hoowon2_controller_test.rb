require 'test_helper'

class Hoowon2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hoowon2_index_url
    assert_response :success
  end

end
