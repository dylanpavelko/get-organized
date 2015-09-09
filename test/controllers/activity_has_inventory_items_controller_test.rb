require 'test_helper'

class ActivityHasInventoryItemsControllerTest < ActionController::TestCase
  setup do
    @activity_has_inventory_item = activity_has_inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_has_inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_has_inventory_item" do
    assert_difference('ActivityHasInventoryItem.count') do
      post :create, activity_has_inventory_item: { activity_id: @activity_has_inventory_item.activity_id, inventory_item_id: @activity_has_inventory_item.inventory_item_id }
    end

    assert_redirected_to activity_has_inventory_item_path(assigns(:activity_has_inventory_item))
  end

  test "should show activity_has_inventory_item" do
    get :show, id: @activity_has_inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_has_inventory_item
    assert_response :success
  end

  test "should update activity_has_inventory_item" do
    patch :update, id: @activity_has_inventory_item, activity_has_inventory_item: { activity_id: @activity_has_inventory_item.activity_id, inventory_item_id: @activity_has_inventory_item.inventory_item_id }
    assert_redirected_to activity_has_inventory_item_path(assigns(:activity_has_inventory_item))
  end

  test "should destroy activity_has_inventory_item" do
    assert_difference('ActivityHasInventoryItem.count', -1) do
      delete :destroy, id: @activity_has_inventory_item
    end

    assert_redirected_to activity_has_inventory_items_path
  end
end
