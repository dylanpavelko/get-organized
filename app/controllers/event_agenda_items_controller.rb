class EventAgendaItemsController < ApplicationController
  before_action :set_event_agenda_item, only: [:show, :edit, :update, :destroy]

  # GET /event_agenda_items
  # GET /event_agenda_items.json
  def index
    @event_agenda_items = EventAgendaItem.all
  end

  # GET /event_agenda_items/1
  # GET /event_agenda_items/1.json
  def show
  end

  # GET /event_agenda_items/new
  def new
    @event_agenda_item = EventAgendaItem.new
  end

  # GET /event_agenda_items/1/edit
  def edit
  end

  # POST /event_agenda_items
  # POST /event_agenda_items.json
  def create
    @event_agenda_item = EventAgendaItem.new(event_agenda_item_params)

    respond_to do |format|
      if @event_agenda_item.save
        format.html { redirect_to @event_agenda_item, notice: 'Event agenda item was successfully created.' }
        format.json { render :show, status: :created, location: @event_agenda_item }
      else
        format.html { render :new }
        format.json { render json: @event_agenda_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_agenda_items/1
  # PATCH/PUT /event_agenda_items/1.json
  def update
    respond_to do |format|
      if @event_agenda_item.update(event_agenda_item_params)
        format.html { redirect_to @event_agenda_item, notice: 'Event agenda item was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_agenda_item }
      else
        format.html { render :edit }
        format.json { render json: @event_agenda_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_agenda_items/1
  # DELETE /event_agenda_items/1.json
  def destroy
    @event_agenda_item.destroy
    respond_to do |format|
      format.html { redirect_to event_agenda_items_url, notice: 'Event agenda item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_agenda_item
      @event_agenda_item = EventAgendaItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_agenda_item_params
      params.require(:event_agenda_item).permit(:name)
    end
end
