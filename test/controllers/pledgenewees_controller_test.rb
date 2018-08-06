require 'test_helper'

class PledgeneweesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pledgenewee = pledgenewees(:one)
  end

  test "should get index" do
    get pledgenewees_url
    assert_response :success
  end

  test "should get new" do
    get new_pledgenewee_url
    assert_response :success
  end

  test "should create pledgenewee" do
    assert_difference('Pledgenewee.count') do
      post pledgenewees_url, params: { pledgenewee: { content2: @pledgenewee.content2, content3: @pledgenewee.content3, content: @pledgenewee.content, name: @pledgenewee.name, title2: @pledgenewee.title2, title3: @pledgenewee.title3, title: @pledgenewee.title } }
    end

    assert_redirected_to pledgenewee_url(Pledgenewee.last)
  end

  test "should show pledgenewee" do
    get pledgenewee_url(@pledgenewee)
    assert_response :success
  end

  test "should get edit" do
    get edit_pledgenewee_url(@pledgenewee)
    assert_response :success
  end

  test "should update pledgenewee" do
    patch pledgenewee_url(@pledgenewee), params: { pledgenewee: { content2: @pledgenewee.content2, content3: @pledgenewee.content3, content: @pledgenewee.content, name: @pledgenewee.name, title2: @pledgenewee.title2, title3: @pledgenewee.title3, title: @pledgenewee.title } }
    assert_redirected_to pledgenewee_url(@pledgenewee)
  end

  test "should destroy pledgenewee" do
    assert_difference('Pledgenewee.count', -1) do
      delete pledgenewee_url(@pledgenewee)
    end

    assert_redirected_to pledgenewees_url
  end
end
