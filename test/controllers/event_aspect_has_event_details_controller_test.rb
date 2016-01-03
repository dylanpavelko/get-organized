require 'test_helper'

class EventAspectHasEventDetailsControllerTest < ActionController::TestCase
  setup do
    @event_aspect_has_event_detail = event_aspect_has_event_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_aspect_has_event_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_aspect_has_event_detail" do
    assert_difference('EventAspectHasEventDetail.count') do
      post :create, event_aspect_has_event_detail: { activity_aspect_id: @event_aspect_has_event_detail.activity_aspect_id, event_detail_id: @event_aspect_has_event_detail.event_detail_id }
    end

    assert_redirected_to event_aspect_has_event_detail_path(assigns(:event_aspect_has_event_detail))
  end

  test "should show event_aspect_has_event_detail" do
    get :show, id: @event_aspect_has_event_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_aspect_has_event_detail
    assert_response :success
  end

  test "should update event_aspect_has_event_detail" do
    patch :update, id: @event_aspect_has_event_detail, event_aspect_has_event_detail: { activity_aspect_id: @event_aspect_has_event_detail.activity_aspect_id, event_detail_id: @event_aspect_has_event_detail.event_detail_id }
    assert_redirected_to event_aspect_has_event_detail_path(assigns(:event_aspect_has_event_detail))
  end

  test "should destroy event_aspect_has_event_detail" do
    assert_difference('EventAspectHasEventDetail.count', -1) do
      delete :destroy, id: @event_aspect_has_event_detail
    end

    assert_redirected_to event_aspect_has_event_details_path
  end
end
