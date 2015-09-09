require 'test_helper'

class QuantityTypesControllerTest < ActionController::TestCase
  setup do
    @quantity_type = quantity_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quantity_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quantity_type" do
    assert_difference('QuantityType.count') do
      post :create, quantity_type: { quantityType: @quantity_type.quantityType }
    end

    assert_redirected_to quantity_type_path(assigns(:quantity_type))
  end

  test "should show quantity_type" do
    get :show, id: @quantity_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quantity_type
    assert_response :success
  end

  test "should update quantity_type" do
    patch :update, id: @quantity_type, quantity_type: { quantityType: @quantity_type.quantityType }
    assert_redirected_to quantity_type_path(assigns(:quantity_type))
  end

  test "should destroy quantity_type" do
    assert_difference('QuantityType.count', -1) do
      delete :destroy, id: @quantity_type
    end

    assert_redirected_to quantity_types_path
  end
end
