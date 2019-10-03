require 'test_helper'

class PlannedMealsControllerTest < ActionController::TestCase
  setup do
    @planned_meal = planned_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planned_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planned_meal" do
    assert_difference('PlannedMeal.count') do
      post :create, planned_meal: { attraction_id: @planned_meal.attraction_id, comment: @planned_meal.comment, eat_out: @planned_meal.eat_out, food_item_id: @planned_meal.food_item_id, left_overs: @planned_meal.left_overs, meal_date: @planned_meal.meal_date, meal_type: @planned_meal.meal_type, order: @planned_meal.order, planned_meal_id: @planned_meal.planned_meal_id, recipe_id: @planned_meal.recipe_id, text: @planned_meal.text, url: @planned_meal.url }
    end

    assert_redirected_to planned_meal_path(assigns(:planned_meal))
  end

  test "should show planned_meal" do
    get :show, id: @planned_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planned_meal
    assert_response :success
  end

  test "should update planned_meal" do
    patch :update, id: @planned_meal, planned_meal: { attraction_id: @planned_meal.attraction_id, comment: @planned_meal.comment, eat_out: @planned_meal.eat_out, food_item_id: @planned_meal.food_item_id, left_overs: @planned_meal.left_overs, meal_date: @planned_meal.meal_date, meal_type: @planned_meal.meal_type, order: @planned_meal.order, planned_meal_id: @planned_meal.planned_meal_id, recipe_id: @planned_meal.recipe_id, text: @planned_meal.text, url: @planned_meal.url }
    assert_redirected_to planned_meal_path(assigns(:planned_meal))
  end

  test "should destroy planned_meal" do
    assert_difference('PlannedMeal.count', -1) do
      delete :destroy, id: @planned_meal
    end

    assert_redirected_to planned_meals_path
  end
end
