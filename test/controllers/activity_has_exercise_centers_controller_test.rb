require 'test_helper'

class ActivityHasExerciseCentersControllerTest < ActionController::TestCase
  setup do
    @activity_has_exercise_center = activity_has_exercise_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_has_exercise_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_has_exercise_center" do
    assert_difference('ActivityHasExerciseCenter.count') do
      post :create, activity_has_exercise_center: { activity_id: @activity_has_exercise_center.activity_id, exercise_center_id: @activity_has_exercise_center.exercise_center_id }
    end

    assert_redirected_to activity_has_exercise_center_path(assigns(:activity_has_exercise_center))
  end

  test "should show activity_has_exercise_center" do
    get :show, id: @activity_has_exercise_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_has_exercise_center
    assert_response :success
  end

  test "should update activity_has_exercise_center" do
    patch :update, id: @activity_has_exercise_center, activity_has_exercise_center: { activity_id: @activity_has_exercise_center.activity_id, exercise_center_id: @activity_has_exercise_center.exercise_center_id }
    assert_redirected_to activity_has_exercise_center_path(assigns(:activity_has_exercise_center))
  end

  test "should destroy activity_has_exercise_center" do
    assert_difference('ActivityHasExerciseCenter.count', -1) do
      delete :destroy, id: @activity_has_exercise_center
    end

    assert_redirected_to activity_has_exercise_centers_path
  end
end
