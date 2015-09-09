require 'test_helper'

class AttractionCategoriesControllerTest < ActionController::TestCase
  setup do
    @attraction_category = attraction_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attraction_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction_category" do
    assert_difference('AttractionCategory.count') do
      post :create, attraction_category: { name: @attraction_category.name }
    end

    assert_redirected_to attraction_category_path(assigns(:attraction_category))
  end

  test "should show attraction_category" do
    get :show, id: @attraction_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction_category
    assert_response :success
  end

  test "should update attraction_category" do
    patch :update, id: @attraction_category, attraction_category: { name: @attraction_category.name }
    assert_redirected_to attraction_category_path(assigns(:attraction_category))
  end

  test "should destroy attraction_category" do
    assert_difference('AttractionCategory.count', -1) do
      delete :destroy, id: @attraction_category
    end

    assert_redirected_to attraction_categories_path
  end
end
