require 'test_helper'

class ActivityAspectHasEventDetailsControllerTest < ActionController::TestCase
  setup do
    @activity_aspect_has_event_detail = activity_aspect_has_event_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_aspect_has_event_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_aspect_has_event_detail" do
    assert_difference('ActivityAspectHasEventDetail.count') do
      post :create, activity_aspect_has_event_detail: { activity_aspect_id: @activity_aspect_has_event_detail.activity_aspect_id, event_detail_id: @activity_aspect_has_event_detail.event_detail_id }
    end

    assert_redirected_to activity_aspect_has_event_detail_path(assigns(:activity_aspect_has_event_detail))
  end

  test "should show activity_aspect_has_event_detail" do
    get :show, id: @activity_aspect_has_event_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_aspect_has_event_detail
    assert_response :success
  end

  test "should update activity_aspect_has_event_detail" do
    patch :update, id: @activity_aspect_has_event_detail, activity_aspect_has_event_detail: { activity_aspect_id: @activity_aspect_has_event_detail.activity_aspect_id, event_detail_id: @activity_aspect_has_event_detail.event_detail_id }
    assert_redirected_to activity_aspect_has_event_detail_path(assigns(:activity_aspect_has_event_detail))
  end

  test "should destroy activity_aspect_has_event_detail" do
    assert_difference('ActivityAspectHasEventDetail.count', -1) do
      delete :destroy, id: @activity_aspect_has_event_detail
    end

    assert_redirected_to activity_aspect_has_event_details_path
  end
end
