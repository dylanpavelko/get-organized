require 'test_helper'

class EventTemplateHasEventActivitiesControllerTest < ActionController::TestCase
  setup do
    @event_template_has_event_activity = event_template_has_event_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_template_has_event_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_template_has_event_activity" do
    assert_difference('EventTemplateHasEventActivity.count') do
      post :create, event_template_has_event_activity: { activities_id: @event_template_has_event_activity.activities_id, event_id: @event_template_has_event_activity.event_id }
    end

    assert_redirected_to event_template_has_event_activity_path(assigns(:event_template_has_event_activity))
  end

  test "should show event_template_has_event_activity" do
    get :show, id: @event_template_has_event_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_template_has_event_activity
    assert_response :success
  end

  test "should update event_template_has_event_activity" do
    patch :update, id: @event_template_has_event_activity, event_template_has_event_activity: { activities_id: @event_template_has_event_activity.activities_id, event_id: @event_template_has_event_activity.event_id }
    assert_redirected_to event_template_has_event_activity_path(assigns(:event_template_has_event_activity))
  end

  test "should destroy event_template_has_event_activity" do
    assert_difference('EventTemplateHasEventActivity.count', -1) do
      delete :destroy, id: @event_template_has_event_activity
    end

    assert_redirected_to event_template_has_event_activities_path
  end
end
