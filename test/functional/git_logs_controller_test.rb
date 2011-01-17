require 'test_helper'

class GitLogsControllerTest < ActionController::TestCase
  setup do
    @git_log = git_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:git_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create git_log" do
    assert_difference('GitLog.count') do
      post :create, :git_log => @git_log.attributes
    end

    assert_redirected_to git_log_path(assigns(:git_log))
  end

  test "should show git_log" do
    get :show, :id => @git_log.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @git_log.to_param
    assert_response :success
  end

  test "should update git_log" do
    put :update, :id => @git_log.to_param, :git_log => @git_log.attributes
    assert_redirected_to git_log_path(assigns(:git_log))
  end

  test "should destroy git_log" do
    assert_difference('GitLog.count', -1) do
      delete :destroy, :id => @git_log.to_param
    end

    assert_redirected_to git_logs_path
  end
end
