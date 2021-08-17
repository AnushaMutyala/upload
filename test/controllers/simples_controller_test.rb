require 'test_helper'

class SimplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @simple = simples(:one)
  end

  test "should get index" do
    get simples_url
    assert_response :success
  end

  test "should get new" do
    get new_simple_url
    assert_response :success
  end

  test "should create simple" do
    assert_difference('Simple.count') do
      post simples_url, params: { simple: { dateofbirth: @simple.dateofbirth, email: @simple.email, fullname: @simple.fullname, mobile: @simple.mobile } }
    end

    assert_redirected_to simple_url(Simple.last)
  end

  test "should show simple" do
    get simple_url(@simple)
    assert_response :success
  end

  test "should get edit" do
    get edit_simple_url(@simple)
    assert_response :success
  end

  test "should update simple" do
    patch simple_url(@simple), params: { simple: { dateofbirth: @simple.dateofbirth, email: @simple.email, fullname: @simple.fullname, mobile: @simple.mobile } }
    assert_redirected_to simple_url(@simple)
  end

  test "should destroy simple" do
    assert_difference('Simple.count', -1) do
      delete simple_url(@simple)
    end

    assert_redirected_to simples_url
  end
end
