require 'test_helper'

class InventoryOwnersControllerTest < ActionController::TestCase
  setup do
    @inventory_owner = inventory_owners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_owners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_owner" do
    assert_difference('InventoryOwner.count') do
      post :create, inventory_owner: { amount: @inventory_owner.amount, inventory_item_id: @inventory_owner.inventory_item_id, person_id: @inventory_owner.person_id, quantity_type_id: @inventory_owner.quantity_type_id }
    end

    assert_redirected_to inventory_owner_path(assigns(:inventory_owner))
  end

  test "should show inventory_owner" do
    get :show, id: @inventory_owner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_owner
    assert_response :success
  end

  test "should update inventory_owner" do
    patch :update, id: @inventory_owner, inventory_owner: { amount: @inventory_owner.amount, inventory_item_id: @inventory_owner.inventory_item_id, person_id: @inventory_owner.person_id, quantity_type_id: @inventory_owner.quantity_type_id }
    assert_redirected_to inventory_owner_path(assigns(:inventory_owner))
  end

  test "should destroy inventory_owner" do
    assert_difference('InventoryOwner.count', -1) do
      delete :destroy, id: @inventory_owner
    end

    assert_redirected_to inventory_owners_path
  end
end
