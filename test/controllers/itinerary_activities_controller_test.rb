require 'test_helper'

class ItineraryActivitiesControllerTest < ActionController::TestCase
  setup do
    @itinerary_activity = itinerary_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:itinerary_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create itinerary_activity" do
    assert_difference('ItineraryActivity.count') do
      post :create, itinerary_activity: { attraction_id: @itinerary_activity.attraction_id, basis_id: @itinerary_activity.basis_id, cost: @itinerary_activity.cost, datetime: @itinerary_activity.datetime, name: @itinerary_activity.name, order: @itinerary_activity.order }
    end

    assert_redirected_to itinerary_activity_path(assigns(:itinerary_activity))
  end

  test "should show itinerary_activity" do
    get :show, id: @itinerary_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @itinerary_activity
    assert_response :success
  end

  test "should update itinerary_activity" do
    patch :update, id: @itinerary_activity, itinerary_activity: { attraction_id: @itinerary_activity.attraction_id, basis_id: @itinerary_activity.basis_id, cost: @itinerary_activity.cost, datetime: @itinerary_activity.datetime, name: @itinerary_activity.name, order: @itinerary_activity.order }
    assert_redirected_to itinerary_activity_path(assigns(:itinerary_activity))
  end

  test "should destroy itinerary_activity" do
    assert_difference('ItineraryActivity.count', -1) do
      delete :destroy, id: @itinerary_activity
    end

    assert_redirected_to itinerary_activities_path
  end
end
