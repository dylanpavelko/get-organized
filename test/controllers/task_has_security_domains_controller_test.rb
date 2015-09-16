require 'test_helper'

class TaskHasSecurityDomainsControllerTest < ActionController::TestCase
  setup do
    @task_has_security_domain = task_has_security_domains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:task_has_security_domains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task_has_security_domain" do
    assert_difference('TaskHasSecurityDomain.count') do
      post :create, task_has_security_domain: { security_domain_id: @task_has_security_domain.security_domain_id, task_id: @task_has_security_domain.task_id }
    end

    assert_redirected_to task_has_security_domain_path(assigns(:task_has_security_domain))
  end

  test "should show task_has_security_domain" do
    get :show, id: @task_has_security_domain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task_has_security_domain
    assert_response :success
  end

  test "should update task_has_security_domain" do
    patch :update, id: @task_has_security_domain, task_has_security_domain: { security_domain_id: @task_has_security_domain.security_domain_id, task_id: @task_has_security_domain.task_id }
    assert_redirected_to task_has_security_domain_path(assigns(:task_has_security_domain))
  end

  test "should destroy task_has_security_domain" do
    assert_difference('TaskHasSecurityDomain.count', -1) do
      delete :destroy, id: @task_has_security_domain
    end

    assert_redirected_to task_has_security_domains_path
  end
end
