require 'test_helper'

class TripHasParticipantsControllerTest < ActionController::TestCase
  setup do
    @trip_has_participant = trip_has_participants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_has_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_has_participant" do
    assert_difference('TripHasParticipant.count') do
      post :create, trip_has_participant: { organizer: @trip_has_participant.organizer, participant: @trip_has_participant.participant, private_viewer: @trip_has_participant.private_viewer, traveler: @trip_has_participant.traveler }
    end

    assert_redirected_to trip_has_participant_path(assigns(:trip_has_participant))
  end

  test "should show trip_has_participant" do
    get :show, id: @trip_has_participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip_has_participant
    assert_response :success
  end

  test "should update trip_has_participant" do
    patch :update, id: @trip_has_participant, trip_has_participant: { organizer: @trip_has_participant.organizer, participant: @trip_has_participant.participant, private_viewer: @trip_has_participant.private_viewer, traveler: @trip_has_participant.traveler }
    assert_redirected_to trip_has_participant_path(assigns(:trip_has_participant))
  end

  test "should destroy trip_has_participant" do
    assert_difference('TripHasParticipant.count', -1) do
      delete :destroy, id: @trip_has_participant
    end

    assert_redirected_to trip_has_participants_path
  end
end
