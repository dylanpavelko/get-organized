require 'test_helper'

class StockPurchaseTypesControllerTest < ActionController::TestCase
  setup do
    @stock_purchase_type = stock_purchase_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_purchase_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_purchase_type" do
    assert_difference('StockPurchaseType.count') do
      post :create, stock_purchase_type: { name: @stock_purchase_type.name }
    end

    assert_redirected_to stock_purchase_type_path(assigns(:stock_purchase_type))
  end

  test "should show stock_purchase_type" do
    get :show, id: @stock_purchase_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_purchase_type
    assert_response :success
  end

  test "should update stock_purchase_type" do
    patch :update, id: @stock_purchase_type, stock_purchase_type: { name: @stock_purchase_type.name }
    assert_redirected_to stock_purchase_type_path(assigns(:stock_purchase_type))
  end

  test "should destroy stock_purchase_type" do
    assert_difference('StockPurchaseType.count', -1) do
      delete :destroy, id: @stock_purchase_type
    end

    assert_redirected_to stock_purchase_types_path
  end
end
