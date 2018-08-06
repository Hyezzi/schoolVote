require 'test_helper'

class VoteLogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote_log = vote_logs(:one)
  end

  test "should get index" do
    get vote_logs_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_log_url
    assert_response :success
  end

  test "should create vote_log" do
    assert_difference('VoteLog.count') do
      post vote_logs_url, params: { vote_log: { image: @vote_log.image, name: @vote_log.name, studentID: @vote_log.studentID } }
    end

    assert_redirected_to vote_log_url(VoteLog.last)
  end

  test "should show vote_log" do
    get vote_log_url(@vote_log)
    assert_response :success
  end

  test "should get edit" do
    get edit_vote_log_url(@vote_log)
    assert_response :success
  end

  test "should update vote_log" do
    patch vote_log_url(@vote_log), params: { vote_log: { image: @vote_log.image, name: @vote_log.name, studentID: @vote_log.studentID } }
    assert_redirected_to vote_log_url(@vote_log)
  end

  test "should destroy vote_log" do
    assert_difference('VoteLog.count', -1) do
      delete vote_log_url(@vote_log)
    end

    assert_redirected_to vote_logs_url
  end
end
