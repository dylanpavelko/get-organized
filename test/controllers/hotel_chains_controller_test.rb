require 'test_helper'

class HotelChainsControllerTest < ActionController::TestCase
  setup do
    @hotel_chain = hotel_chains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_chains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_chain" do
    assert_difference('HotelChain.count') do
      post :create, hotel_chain: { image: @hotel_chain.image, loyalty_program_id: @hotel_chain.loyalty_program_id, name: @hotel_chain.name }
    end

    assert_redirected_to hotel_chain_path(assigns(:hotel_chain))
  end

  test "should show hotel_chain" do
    get :show, id: @hotel_chain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_chain
    assert_response :success
  end

  test "should update hotel_chain" do
    patch :update, id: @hotel_chain, hotel_chain: { image: @hotel_chain.image, loyalty_program_id: @hotel_chain.loyalty_program_id, name: @hotel_chain.name }
    assert_redirected_to hotel_chain_path(assigns(:hotel_chain))
  end

  test "should destroy hotel_chain" do
    assert_difference('HotelChain.count', -1) do
      delete :destroy, id: @hotel_chain
    end

    assert_redirected_to hotel_chains_path
  end
end
