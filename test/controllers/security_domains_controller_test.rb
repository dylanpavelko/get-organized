require 'test_helper'

class SecurityDomainsControllerTest < ActionController::TestCase
  setup do
    @security_domain = security_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:security_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create security_domain" do
    assert_difference('SecurityDomain.count') do
      post :create, security_domain: { name: @security_domain.name }
    end

    assert_redirected_to security_domain_path(assigns(:security_domain))
  end

  test "should show security_domain" do
    get :show, id: @security_domain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @security_domain
    assert_response :success
  end

  test "should update security_domain" do
    patch :update, id: @security_domain, security_domain: { name: @security_domain.name }
    assert_redirected_to security_domain_path(assigns(:security_domain))
  end

  test "should destroy security_domain" do
    assert_difference('SecurityDomain.count', -1) do
      delete :destroy, id: @security_domain
    end

    assert_redirected_to security_domains_path
  end
end
