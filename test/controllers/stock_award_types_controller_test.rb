require 'test_helper'

class StockAwardTypesControllerTest < ActionController::TestCase
  setup do
    @stock_award_type = stock_award_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_award_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_award_type" do
    assert_difference('StockAwardType.count') do
      post :create, stock_award_type: { name: @stock_award_type.name }
    end

    assert_redirected_to stock_award_type_path(assigns(:stock_award_type))
  end

  test "should show stock_award_type" do
    get :show, id: @stock_award_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_award_type
    assert_response :success
  end

  test "should update stock_award_type" do
    patch :update, id: @stock_award_type, stock_award_type: { name: @stock_award_type.name }
    assert_redirected_to stock_award_type_path(assigns(:stock_award_type))
  end

  test "should destroy stock_award_type" do
    assert_difference('StockAwardType.count', -1) do
      delete :destroy, id: @stock_award_type
    end

    assert_redirected_to stock_award_types_path
  end
end
