require 'test_helper'

class JobSeekersControllerTest < ActionController::TestCase
  setup do
    @job_seeker = job_seekers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_seekers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_seeker" do
    assert_difference('JobSeeker.count') do
      post :create, job_seeker: {  }
    end

    assert_redirected_to job_seeker_path(assigns(:job_seeker))
  end

  test "should show job_seeker" do
    get :show, id: @job_seeker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_seeker
    assert_response :success
  end

  test "should update job_seeker" do
    patch :update, id: @job_seeker, job_seeker: {  }
    assert_redirected_to job_seeker_path(assigns(:job_seeker))
  end

  test "should destroy job_seeker" do
    assert_difference('JobSeeker.count', -1) do
      delete :destroy, id: @job_seeker
    end

    assert_redirected_to job_seekers_path
  end
end
