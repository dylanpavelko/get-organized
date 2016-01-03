require 'test_helper'

class EventHasAspectsControllerTest < ActionController::TestCase
  setup do
    @event_has_aspect = event_has_aspects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_has_aspects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_has_aspect" do
    assert_difference('EventHasAspect.count') do
      post :create, event_has_aspect: { event_id: @event_has_aspect.event_id, planning_aspect_id: @event_has_aspect.planning_aspect_id }
    end

    assert_redirected_to event_has_aspect_path(assigns(:event_has_aspect))
  end

  test "should show event_has_aspect" do
    get :show, id: @event_has_aspect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_has_aspect
    assert_response :success
  end

  test "should update event_has_aspect" do
    patch :update, id: @event_has_aspect, event_has_aspect: { event_id: @event_has_aspect.event_id, planning_aspect_id: @event_has_aspect.planning_aspect_id }
    assert_redirected_to event_has_aspect_path(assigns(:event_has_aspect))
  end

  test "should destroy event_has_aspect" do
    assert_difference('EventHasAspect.count', -1) do
      delete :destroy, id: @event_has_aspect
    end

    assert_redirected_to event_has_aspects_path
  end
end
