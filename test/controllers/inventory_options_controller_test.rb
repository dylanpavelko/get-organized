require 'test_helper'

class InventoryOptionsControllerTest < ActionController::TestCase
  setup do
    @inventory_option = inventory_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_option" do
    assert_difference('InventoryOption.count') do
      post :create, inventory_option: { food_items_id: @inventory_option.food_items_id, inventory_item_id: @inventory_option.inventory_item_id }
    end

    assert_redirected_to inventory_option_path(assigns(:inventory_option))
  end

  test "should show inventory_option" do
    get :show, id: @inventory_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_option
    assert_response :success
  end

  test "should update inventory_option" do
    patch :update, id: @inventory_option, inventory_option: { food_items_id: @inventory_option.food_items_id, inventory_item_id: @inventory_option.inventory_item_id }
    assert_redirected_to inventory_option_path(assigns(:inventory_option))
  end

  test "should destroy inventory_option" do
    assert_difference('InventoryOption.count', -1) do
      delete :destroy, id: @inventory_option
    end

    assert_redirected_to inventory_options_path
  end
end
