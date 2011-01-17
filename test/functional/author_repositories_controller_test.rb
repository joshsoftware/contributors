require 'test_helper'

class AuthorRepositoriesControllerTest < ActionController::TestCase
  setup do
    @author_repository = author_repositories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:author_repositories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author_repository" do
    assert_difference('AuthorRepository.count') do
      post :create, :author_repository => @author_repository.attributes
    end

    assert_redirected_to author_repository_path(assigns(:author_repository))
  end

  test "should show author_repository" do
    get :show, :id => @author_repository.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @author_repository.to_param
    assert_response :success
  end

  test "should update author_repository" do
    put :update, :id => @author_repository.to_param, :author_repository => @author_repository.attributes
    assert_redirected_to author_repository_path(assigns(:author_repository))
  end

  test "should destroy author_repository" do
    assert_difference('AuthorRepository.count', -1) do
      delete :destroy, :id => @author_repository.to_param
    end

    assert_redirected_to author_repositories_path
  end
end
