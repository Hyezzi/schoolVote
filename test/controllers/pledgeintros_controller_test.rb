require 'test_helper'

class PledgeintrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pledgeintro = pledgeintros(:one)
  end

  test "should get index" do
    get pledgeintros_url
    assert_response :success
  end

  test "should get new" do
    get new_pledgeintro_url
    assert_response :success
  end

  test "should create pledgeintro" do
    assert_difference('Pledgeintro.count') do
      post pledgeintros_url, params: { pledgeintro: { content2: @pledgeintro.content2, content: @pledgeintro.content, title: @pledgeintro.title } }
    end

    assert_redirected_to pledgeintro_url(Pledgeintro.last)
  end

  test "should show pledgeintro" do
    get pledgeintro_url(@pledgeintro)
    assert_response :success
  end

  test "should get edit" do
    get edit_pledgeintro_url(@pledgeintro)
    assert_response :success
  end

  test "should update pledgeintro" do
    patch pledgeintro_url(@pledgeintro), params: { pledgeintro: { content2: @pledgeintro.content2, content: @pledgeintro.content, title: @pledgeintro.title } }
    assert_redirected_to pledgeintro_url(@pledgeintro)
  end

  test "should destroy pledgeintro" do
    assert_difference('Pledgeintro.count', -1) do
      delete pledgeintro_url(@pledgeintro)
    end

    assert_redirected_to pledgeintros_url
  end
end
