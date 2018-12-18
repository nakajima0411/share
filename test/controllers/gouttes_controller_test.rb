require 'test_helper'

class GouttesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goutte = gouttes(:one)
  end

  test "should get index" do
    get gouttes_url
    assert_response :success
  end

  test "should get new" do
    get new_goutte_url
    assert_response :success
  end

  test "should create goutte" do
    assert_difference('Goutte.count') do
      post gouttes_url, params: { goutte: { comment_id: @goutte.comment_id, user_id: @goutte.user_id } }
    end

    assert_redirected_to goutte_url(Goutte.last)
  end

  test "should show goutte" do
    get goutte_url(@goutte)
    assert_response :success
  end

  test "should get edit" do
    get edit_goutte_url(@goutte)
    assert_response :success
  end

  test "should update goutte" do
    patch goutte_url(@goutte), params: { goutte: { comment_id: @goutte.comment_id, user_id: @goutte.user_id } }
    assert_redirected_to goutte_url(@goutte)
  end

  test "should destroy goutte" do
    assert_difference('Goutte.count', -1) do
      delete goutte_url(@goutte)
    end

    assert_redirected_to gouttes_url
  end
end
