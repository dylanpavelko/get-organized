require 'test_helper'

class EventTemplateHasAspectsControllerTest < ActionController::TestCase
  setup do
    @event_template_has_aspect = event_template_has_aspects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_template_has_aspects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_template_has_aspect" do
    assert_difference('EventTemplateHasAspect.count') do
      post :create, event_template_has_aspect: { event_id: @event_template_has_aspect.event_id, planning_aspect_id: @event_template_has_aspect.planning_aspect_id }
    end

    assert_redirected_to event_template_has_aspect_path(assigns(:event_template_has_aspect))
  end

  test "should show event_template_has_aspect" do
    get :show, id: @event_template_has_aspect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_template_has_aspect
    assert_response :success
  end

  test "should update event_template_has_aspect" do
    patch :update, id: @event_template_has_aspect, event_template_has_aspect: { event_id: @event_template_has_aspect.event_id, planning_aspect_id: @event_template_has_aspect.planning_aspect_id }
    assert_redirected_to event_template_has_aspect_path(assigns(:event_template_has_aspect))
  end

  test "should destroy event_template_has_aspect" do
    assert_difference('EventTemplateHasAspect.count', -1) do
      delete :destroy, id: @event_template_has_aspect
    end

    assert_redirected_to event_template_has_aspects_path
  end
end
