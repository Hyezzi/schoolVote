require 'test_helper'

class HoowonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hoowon = hoowons(:one)
  end

  test "should get index" do
    get hoowons_url
    assert_response :success
  end

  test "should get new" do
    get new_hoowon_url
    assert_response :success
  end

  test "should create hoowon" do
    assert_difference('Hoowon.count') do
      post hoowons_url, params: { hoowon: { given: @hoowon.given, name: @hoowon.name } }
    end

    assert_redirected_to hoowon_url(Hoowon.last)
  end

  test "should show hoowon" do
    get hoowon_url(@hoowon)
    assert_response :success
  end

  test "should get edit" do
    get edit_hoowon_url(@hoowon)
    assert_response :success
  end

  test "should update hoowon" do
    patch hoowon_url(@hoowon), params: { hoowon: { given: @hoowon.given, name: @hoowon.name } }
    assert_redirected_to hoowon_url(@hoowon)
  end

  test "should destroy hoowon" do
    assert_difference('Hoowon.count', -1) do
      delete hoowon_url(@hoowon)
    end

    assert_redirected_to hoowons_url
  end
end
