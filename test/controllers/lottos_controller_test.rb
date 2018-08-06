require 'test_helper'

class LottosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lotto = lottos(:one)
  end

  test "should get index" do
    get lottos_url
    assert_response :success
  end

  test "should get new" do
    get new_lotto_url
    assert_response :success
  end

  test "should create lotto" do
    assert_difference('Lotto.count') do
      post lottos_url, params: { lotto: { result: @lotto.result, totalnum: @lotto.totalnum, winnum: @lotto.winnum } }
    end

    assert_redirected_to lotto_url(Lotto.last)
  end

  test "should show lotto" do
    get lotto_url(@lotto)
    assert_response :success
  end

  test "should get edit" do
    get edit_lotto_url(@lotto)
    assert_response :success
  end

  test "should update lotto" do
    patch lotto_url(@lotto), params: { lotto: { result: @lotto.result, totalnum: @lotto.totalnum, winnum: @lotto.winnum } }
    assert_redirected_to lotto_url(@lotto)
  end

  test "should destroy lotto" do
    assert_difference('Lotto.count', -1) do
      delete lotto_url(@lotto)
    end

    assert_redirected_to lottos_url
  end
end
