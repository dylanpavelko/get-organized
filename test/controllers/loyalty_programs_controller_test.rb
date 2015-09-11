require 'test_helper'

class LoyaltyProgramsControllerTest < ActionController::TestCase
  setup do
    @loyalty_program = loyalty_programs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loyalty_programs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loyalty_program" do
    assert_difference('LoyaltyProgram.count') do
      post :create, loyalty_program: { name: @loyalty_program.name, number: @loyalty_program.number, username: @loyalty_program.username }
    end

    assert_redirected_to loyalty_program_path(assigns(:loyalty_program))
  end

  test "should show loyalty_program" do
    get :show, id: @loyalty_program
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loyalty_program
    assert_response :success
  end

  test "should update loyalty_program" do
    patch :update, id: @loyalty_program, loyalty_program: { name: @loyalty_program.name, number: @loyalty_program.number, username: @loyalty_program.username }
    assert_redirected_to loyalty_program_path(assigns(:loyalty_program))
  end

  test "should destroy loyalty_program" do
    assert_difference('LoyaltyProgram.count', -1) do
      delete :destroy, id: @loyalty_program
    end

    assert_redirected_to loyalty_programs_path
  end
end
