require 'test_helper'

class DashbordsControllerTest < ActionController::TestCase
  setup do
    @dashbord = dashbords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashbords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashbord" do
    assert_difference('Dashbord.count') do
      post :create, dashbord: {  }
    end

    assert_redirected_to dashbord_path(assigns(:dashbord))
  end

  test "should show dashbord" do
    get :show, id: @dashbord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashbord
    assert_response :success
  end

  test "should update dashbord" do
    patch :update, id: @dashbord, dashbord: {  }
    assert_redirected_to dashbord_path(assigns(:dashbord))
  end

  test "should destroy dashbord" do
    assert_difference('Dashbord.count', -1) do
      delete :destroy, id: @dashbord
    end

    assert_redirected_to dashbords_path
  end
end
