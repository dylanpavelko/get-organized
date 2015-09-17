require 'test_helper'

class SecurityDomainHasRolesControllerTest < ActionController::TestCase
  setup do
    @security_domain_has_role = security_domain_has_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_domain_has_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_domain_has_role" do
    assert_difference('SecurityDomainHasRole.count') do
      post :create, security_domain_has_role: { domain_id: @security_domain_has_role.domain_id, role_id: @security_domain_has_role.role_id }
    end

    assert_redirected_to security_domain_has_role_path(assigns(:security_domain_has_role))
  end

  test "should show security_domain_has_role" do
    get :show, id: @security_domain_has_role
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @security_domain_has_role
    assert_response :success
  end

  test "should update security_domain_has_role" do
    patch :update, id: @security_domain_has_role, security_domain_has_role: { domain_id: @security_domain_has_role.domain_id, role_id: @security_domain_has_role.role_id }
    assert_redirected_to security_domain_has_role_path(assigns(:security_domain_has_role))
  end

  test "should destroy security_domain_has_role" do
    assert_difference('SecurityDomainHasRole.count', -1) do
      delete :destroy, id: @security_domain_has_role
    end

    assert_redirected_to security_domain_has_roles_path
  end
end
