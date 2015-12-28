require 'test_helper'

class StockSalesControllerTest < ActionController::TestCase
  setup do
    @stock_sale = stock_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_sale" do
    assert_difference('StockSale.count') do
      post :create, stock_sale: { fees: @stock_sale.fees, person_id: @stock_sale.person_id, price: @stock_sale.price, shares: @stock_sale.shares, stock_award_id: @stock_sale.stock_award_id, stock_id: @stock_sale.stock_id, stock_purchase_id: @stock_sale.stock_purchase_id, trade_date: @stock_sale.trade_date }
    end

    assert_redirected_to stock_sale_path(assigns(:stock_sale))
  end

  test "should show stock_sale" do
    get :show, id: @stock_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_sale
    assert_response :success
  end

  test "should update stock_sale" do
    patch :update, id: @stock_sale, stock_sale: { fees: @stock_sale.fees, person_id: @stock_sale.person_id, price: @stock_sale.price, shares: @stock_sale.shares, stock_award_id: @stock_sale.stock_award_id, stock_id: @stock_sale.stock_id, stock_purchase_id: @stock_sale.stock_purchase_id, trade_date: @stock_sale.trade_date }
    assert_redirected_to stock_sale_path(assigns(:stock_sale))
  end

  test "should destroy stock_sale" do
    assert_difference('StockSale.count', -1) do
      delete :destroy, id: @stock_sale
    end

    assert_redirected_to stock_sales_path
  end
end
