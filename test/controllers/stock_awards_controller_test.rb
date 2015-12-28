require 'test_helper'

class StockAwardsControllerTest < ActionController::TestCase
  setup do
    @stock_award = stock_awards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock_awards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock_award" do
    assert_difference('StockAward.count') do
      post :create, stock_award: { award_date: @stock_award.award_date, award_type: @stock_award.award_type, person_id: @stock_award.person_id, shares: @stock_award.shares, stock_id: @stock_award.stock_id }
    end

    assert_redirected_to stock_award_path(assigns(:stock_award))
  end

  test "should show stock_award" do
    get :show, id: @stock_award
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock_award
    assert_response :success
  end

  test "should update stock_award" do
    patch :update, id: @stock_award, stock_award: { award_date: @stock_award.award_date, award_type: @stock_award.award_type, person_id: @stock_award.person_id, shares: @stock_award.shares, stock_id: @stock_award.stock_id }
    assert_redirected_to stock_award_path(assigns(:stock_award))
  end

  test "should destroy stock_award" do
    assert_difference('StockAward.count', -1) do
      delete :destroy, id: @stock_award
    end

    assert_redirected_to stock_awards_path
  end
end
