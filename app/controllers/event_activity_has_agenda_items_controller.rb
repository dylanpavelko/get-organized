class EventActivityHasAgendaItemsController < ApplicationController
  before_action :set_event_activity_has_agenda_item, only: [:show, :edit, :update, :destroy]

  # GET /event_activity_has_agenda_items
  # GET /event_activity_has_agenda_items.json
  def index
    @event_activity_has_agenda_items = EventActivityHasAgendaItem.all
  end

  # GET /event_activity_has_agenda_items/1
  # GET /event_activity_has_agenda_items/1.json
  def show
  end

  # GET /event_activity_has_agenda_items/new
  def new
    @event_activity_has_agenda_item = EventActivityHasAgendaItem.new
  end

  # GET /event_activity_has_agenda_items/1/edit
  def edit
  end

  # POST /event_activity_has_agenda_items
  # POST /event_activity_has_agenda_items.json
  def create
    @event_activity_has_agenda_item = EventActivityHasAgendaItem.new(event_activity_has_agenda_item_params)

    respond_to do |format|
      if @event_activity_has_agenda_item.save
        format.html { redirect_to @event_activity_has_agenda_item, notice: 'Event activity has agenda item was successfully created.' }
        format.json { render :show, status: :created, location: @event_activity_has_agenda_item }
      else
        format.html { render :new }
        format.json { render json: @event_activity_has_agenda_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_activity_has_agenda_items/1
  # PATCH/PUT /event_activity_has_agenda_items/1.json
  def update
    respond_to do |format|
      if @event_activity_has_agenda_item.update(event_activity_has_agenda_item_params)
        format.html { redirect_to @event_activity_has_agenda_item, notice: 'Event activity has agenda item was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_activity_has_agenda_item }
      else
        format.html { render :edit }
        format.json { render json: @event_activity_has_agenda_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_activity_has_agenda_items/1
  # DELETE /event_activity_has_agenda_items/1.json
  def destroy
    @event_activity_has_agenda_item.destroy
    respond_to do |format|
      format.html { redirect_to event_activity_has_agenda_items_url, notice: 'Event activity has agenda item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity_has_agenda_item
      @event_activity_has_agenda_item = EventActivityHasAgendaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_has_agenda_item_params
      params.require(:event_activity_has_agenda_item).permit(:event_activity_id, :event_agenda_item_id)
    end
end
