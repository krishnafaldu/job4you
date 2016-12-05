require 'test_helper'

class JobAdsControllerTest < ActionController::TestCase
  setup do
    @job_ad = job_ads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_ad" do
    assert_difference('JobAd.count') do
      post :create, job_ad: {  }
    end

    assert_redirected_to job_ad_path(assigns(:job_ad))
  end

  test "should show job_ad" do
    get :show, id: @job_ad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_ad
    assert_response :success
  end

  test "should update job_ad" do
    patch :update, id: @job_ad, job_ad: {  }
    assert_redirected_to job_ad_path(assigns(:job_ad))
  end

  test "should destroy job_ad" do
    assert_difference('JobAd.count', -1) do
      delete :destroy, id: @job_ad
    end

    assert_redirected_to job_ads_path
  end
end
