require 'test_helper'

class InventoryItemsControllerTest < ActionController::TestCase
  setup do
    @inventory_item = inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_item" do
    assert_difference('InventoryItem.count') do
      post :create, inventory_item: { amount: @inventory_item.amount, brand: @inventory_item.brand, consumable: @inventory_item.consumable, detail: @inventory_item.detail, name: @inventory_item.name, note: @inventory_item.note, price: @inventory_item.price, purchase_date: @inventory_item.purchase_date, quantity_type_id: @inventory_item.quantity_type_id }
    end

    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should show inventory_item" do
    get :show, id: @inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_item
    assert_response :success
  end

  test "should update inventory_item" do
    patch :update, id: @inventory_item, inventory_item: { amount: @inventory_item.amount, brand: @inventory_item.brand, consumable: @inventory_item.consumable, detail: @inventory_item.detail, name: @inventory_item.name, note: @inventory_item.note, price: @inventory_item.price, purchase_date: @inventory_item.purchase_date, quantity_type_id: @inventory_item.quantity_type_id }
    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should destroy inventory_item" do
    assert_difference('InventoryItem.count', -1) do
      delete :destroy, id: @inventory_item
    end

    assert_redirected_to inventory_items_path
  end
end
