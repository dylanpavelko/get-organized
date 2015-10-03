require 'test_helper'

class PublicInventoryItemQueuesControllerTest < ActionController::TestCase
  setup do
    @public_inventory_item_queue = public_inventory_item_queues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_inventory_item_queues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_inventory_item_queue" do
    assert_difference('PublicInventoryItemQueue.count') do
      post :create, public_inventory_item_queue: { item_id: @public_inventory_item_queue.item_id, reviewed: @public_inventory_item_queue.reviewed }
    end

    assert_redirected_to public_inventory_item_queue_path(assigns(:public_inventory_item_queue))
  end

  test "should show public_inventory_item_queue" do
    get :show, id: @public_inventory_item_queue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_inventory_item_queue
    assert_response :success
  end

  test "should update public_inventory_item_queue" do
    patch :update, id: @public_inventory_item_queue, public_inventory_item_queue: { item_id: @public_inventory_item_queue.item_id, reviewed: @public_inventory_item_queue.reviewed }
    assert_redirected_to public_inventory_item_queue_path(assigns(:public_inventory_item_queue))
  end

  test "should destroy public_inventory_item_queue" do
    assert_difference('PublicInventoryItemQueue.count', -1) do
      delete :destroy, id: @public_inventory_item_queue
    end

    assert_redirected_to public_inventory_item_queues_path
  end
end
