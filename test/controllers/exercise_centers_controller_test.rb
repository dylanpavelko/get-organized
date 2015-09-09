require 'test_helper'

class ExerciseCentersControllerTest < ActionController::TestCase
  setup do
    @exercise_center = exercise_centers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exercise_centers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exercise_center" do
    assert_difference('ExerciseCenter.count') do
      post :create, exercise_center: { gymType: @exercise_center.gymType, name: @exercise_center.name, notes: @exercise_center.notes, site: @exercise_center.site }
    end

    assert_redirected_to exercise_center_path(assigns(:exercise_center))
  end

  test "should show exercise_center" do
    get :show, id: @exercise_center
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exercise_center
    assert_response :success
  end

  test "should update exercise_center" do
    patch :update, id: @exercise_center, exercise_center: { gymType: @exercise_center.gymType, name: @exercise_center.name, notes: @exercise_center.notes, site: @exercise_center.site }
    assert_redirected_to exercise_center_path(assigns(:exercise_center))
  end

  test "should destroy exercise_center" do
    assert_difference('ExerciseCenter.count', -1) do
      delete :destroy, id: @exercise_center
    end

    assert_redirected_to exercise_centers_path
  end
end
