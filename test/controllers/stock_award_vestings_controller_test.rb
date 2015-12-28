require 'test_helper'

class StockAwardVestingsControllerTest < ActionController::TestCase
  setup do
    @stock_award_vesting = stock_award_vestings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_award_vestings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_award_vesting" do
    assert_difference('StockAwardVesting.count') do
      post :create, stock_award_vesting: { stock_award_id: @stock_award_vesting.stock_award_id, vest_date: @stock_award_vesting.vest_date, vest_quantity: @stock_award_vesting.vest_quantity }
    end

    assert_redirected_to stock_award_vesting_path(assigns(:stock_award_vesting))
  end

  test "should show stock_award_vesting" do
    get :show, id: @stock_award_vesting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_award_vesting
    assert_response :success
  end

  test "should update stock_award_vesting" do
    patch :update, id: @stock_award_vesting, stock_award_vesting: { stock_award_id: @stock_award_vesting.stock_award_id, vest_date: @stock_award_vesting.vest_date, vest_quantity: @stock_award_vesting.vest_quantity }
    assert_redirected_to stock_award_vesting_path(assigns(:stock_award_vesting))
  end

  test "should destroy stock_award_vesting" do
    assert_difference('StockAwardVesting.count', -1) do
      delete :destroy, id: @stock_award_vesting
    end

    assert_redirected_to stock_award_vestings_path
  end
end
