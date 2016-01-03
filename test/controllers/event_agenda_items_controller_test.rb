require 'test_helper'

class EventAgendaItemsControllerTest < ActionController::TestCase
  setup do
    @event_agenda_item = event_agenda_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_agenda_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_agenda_item" do
    assert_difference('EventAgendaItem.count') do
      post :create, event_agenda_item: { name: @event_agenda_item.name }
    end

    assert_redirected_to event_agenda_item_path(assigns(:event_agenda_item))
  end

  test "should show event_agenda_item" do
    get :show, id: @event_agenda_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_agenda_item
    assert_response :success
  end

  test "should update event_agenda_item" do
    patch :update, id: @event_agenda_item, event_agenda_item: { name: @event_agenda_item.name }
    assert_redirected_to event_agenda_item_path(assigns(:event_agenda_item))
  end

  test "should destroy event_agenda_item" do
    assert_difference('EventAgendaItem.count', -1) do
      delete :destroy, id: @event_agenda_item
    end

    assert_redirected_to event_agenda_items_path
  end
end
