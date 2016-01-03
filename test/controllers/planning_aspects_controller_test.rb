require 'test_helper'

class PlanningAspectsControllerTest < ActionController::TestCase
  setup do
    @planning_aspect = planning_aspects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planning_aspects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planning_aspect" do
    assert_difference('PlanningAspect.count') do
      post :create, planning_aspect: { description: @planning_aspect.description, name: @planning_aspect.name }
    end

    assert_redirected_to planning_aspect_path(assigns(:planning_aspect))
  end

  test "should show planning_aspect" do
    get :show, id: @planning_aspect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planning_aspect
    assert_response :success
  end

  test "should update planning_aspect" do
    patch :update, id: @planning_aspect, planning_aspect: { description: @planning_aspect.description, name: @planning_aspect.name }
    assert_redirected_to planning_aspect_path(assigns(:planning_aspect))
  end

  test "should destroy planning_aspect" do
    assert_difference('PlanningAspect.count', -1) do
      delete :destroy, id: @planning_aspect
    end

    assert_redirected_to planning_aspects_path
  end
end
