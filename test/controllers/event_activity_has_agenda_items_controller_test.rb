require 'test_helper'

class EventActivityHasAgendaItemsControllerTest < ActionController::TestCase
  setup do
    @event_activity_has_agenda_item = event_activity_has_agenda_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_activity_has_agenda_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_activity_has_agenda_item" do
    assert_difference('EventActivityHasAgendaItem.count') do
      post :create, event_activity_has_agenda_item: { event_activity_id: @event_activity_has_agenda_item.event_activity_id, event_agenda_item_id: @event_activity_has_agenda_item.event_agenda_item_id }
    end

    assert_redirected_to event_activity_has_agenda_item_path(assigns(:event_activity_has_agenda_item))
  end

  test "should show event_activity_has_agenda_item" do
    get :show, id: @event_activity_has_agenda_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_activity_has_agenda_item
    assert_response :success
  end

  test "should update event_activity_has_agenda_item" do
    patch :update, id: @event_activity_has_agenda_item, event_activity_has_agenda_item: { event_activity_id: @event_activity_has_agenda_item.event_activity_id, event_agenda_item_id: @event_activity_has_agenda_item.event_agenda_item_id }
    assert_redirected_to event_activity_has_agenda_item_path(assigns(:event_activity_has_agenda_item))
  end

  test "should destroy event_activity_has_agenda_item" do
    assert_difference('EventActivityHasAgendaItem.count', -1) do
      delete :destroy, id: @event_activity_has_agenda_item
    end

    assert_redirected_to event_activity_has_agenda_items_path
  end
end
