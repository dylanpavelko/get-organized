require 'test_helper'

class UserHasRolesControllerTest < ActionController::TestCase
  setup do
    @user_has_role = user_has_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_has_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_has_role" do
    assert_difference('UserHasRole.count') do
      post :create, user_has_role: { role_id: @user_has_role.role_id, user_id: @user_has_role.user_id }
    end

    assert_redirected_to user_has_role_path(assigns(:user_has_role))
  end

  test "should show user_has_role" do
    get :show, id: @user_has_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_has_role
    assert_response :success
  end

  test "should update user_has_role" do
    patch :update, id: @user_has_role, user_has_role: { role_id: @user_has_role.role_id, user_id: @user_has_role.user_id }
    assert_redirected_to user_has_role_path(assigns(:user_has_role))
  end

  test "should destroy user_has_role" do
    assert_difference('UserHasRole.count', -1) do
      delete :destroy, id: @user_has_role
    end

    assert_redirected_to user_has_roles_path
  end
end
