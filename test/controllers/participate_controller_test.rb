require 'test_helper'

class ParticipateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get participate_index_url
    assert_response :success
  end

end
