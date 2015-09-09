require 'test_helper'

class TripHasInventoryItemsControllerTest < ActionController::TestCase
  setup do
    @trip_has_inventory_item = trip_has_inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trip_has_inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trip_has_inventory_item" do
    assert_difference('TripHasInventoryItem.count') do
      post :create, trip_has_inventory_item: { inventory_item_id: @trip_has_inventory_item.inventory_item_id, trip_id: @trip_has_inventory_item.trip_id }
    end

    assert_redirected_to trip_has_inventory_item_path(assigns(:trip_has_inventory_item))
  end

  test "should show trip_has_inventory_item" do
    get :show, id: @trip_has_inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trip_has_inventory_item
    assert_response :success
  end

  test "should update trip_has_inventory_item" do
    patch :update, id: @trip_has_inventory_item, trip_has_inventory_item: { inventory_item_id: @trip_has_inventory_item.inventory_item_id, trip_id: @trip_has_inventory_item.trip_id }
    assert_redirected_to trip_has_inventory_item_path(assigns(:trip_has_inventory_item))
  end

  test "should destroy trip_has_inventory_item" do
    assert_difference('TripHasInventoryItem.count', -1) do
      delete :destroy, id: @trip_has_inventory_item
    end

    assert_redirected_to trip_has_inventory_items_path
  end
end
