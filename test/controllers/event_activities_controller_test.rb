require 'test_helper'

class EventActivitiesControllerTest < ActionController::TestCase
  setup do
    @event_activity = event_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_activity" do
    assert_difference('EventActivity.count') do
      post :create, event_activity: { name: @event_activity.name }
    end

    assert_redirected_to event_activity_path(assigns(:event_activity))
  end

  test "should show event_activity" do
    get :show, id: @event_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_activity
    assert_response :success
  end

  test "should update event_activity" do
    patch :update, id: @event_activity, event_activity: { name: @event_activity.name }
    assert_redirected_to event_activity_path(assigns(:event_activity))
  end

  test "should destroy event_activity" do
    assert_difference('EventActivity.count', -1) do
      delete :destroy, id: @event_activity
    end

    assert_redirected_to event_activities_path
  end
end
