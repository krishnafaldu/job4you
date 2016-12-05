require 'test_helper'

class AppointedsControllerTest < ActionController::TestCase
  setup do
    @appointed = appointeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointed" do
    assert_difference('Appointed.count') do
      post :create, appointed: {  }
    end

    assert_redirected_to appointed_path(assigns(:appointed))
  end

  test "should show appointed" do
    get :show, id: @appointed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointed
    assert_response :success
  end

  test "should update appointed" do
    patch :update, id: @appointed, appointed: {  }
    assert_redirected_to appointed_path(assigns(:appointed))
  end

  test "should destroy appointed" do
    assert_difference('Appointed.count', -1) do
      delete :destroy, id: @appointed
    end

    assert_redirected_to appointeds_path
  end
end
