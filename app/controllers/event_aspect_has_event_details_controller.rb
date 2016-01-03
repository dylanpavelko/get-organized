class EventAspectHasEventDetailsController < ApplicationController
  before_action :set_event_aspect_has_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /event_aspect_has_event_details
  # GET /event_aspect_has_event_details.json
  def index
    @event_aspect_has_event_details = EventAspectHasEventDetail.all
  end

  # GET /event_aspect_has_event_details/1
  # GET /event_aspect_has_event_details/1.json
  def show
  end

  # GET /event_aspect_has_event_details/new
  def new
    @event_aspect_has_event_detail = EventAspectHasEventDetail.new
  end

  # GET /event_aspect_has_event_details/1/edit
  def edit
  end

  # POST /event_aspect_has_event_details
  # POST /event_aspect_has_event_details.json
  def create
    @event_aspect_has_event_detail = EventAspectHasEventDetail.new(event_aspect_has_event_detail_params)

    respond_to do |format|
      if @event_aspect_has_event_detail.save
        format.html { redirect_to @event_aspect_has_event_detail, notice: 'Event aspect has event detail was successfully created.' }
        format.json { render :show, status: :created, location: @event_aspect_has_event_detail }
      else
        format.html { render :new }
        format.json { render json: @event_aspect_has_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_aspect_has_event_details/1
  # PATCH/PUT /event_aspect_has_event_details/1.json
  def update
    respond_to do |format|
      if @event_aspect_has_event_detail.update(event_aspect_has_event_detail_params)
        format.html { redirect_to @event_aspect_has_event_detail, notice: 'Event aspect has event detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_aspect_has_event_detail }
      else
        format.html { render :edit }
        format.json { render json: @event_aspect_has_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_aspect_has_event_details/1
  # DELETE /event_aspect_has_event_details/1.json
  def destroy
    @event_aspect_has_event_detail.destroy
    respond_to do |format|
      format.html { redirect_to event_aspect_has_event_details_url, notice: 'Event aspect has event detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_aspect_has_event_detail
      @event_aspect_has_event_detail = EventAspectHasEventDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_aspect_has_event_detail_params
      params.require(:event_aspect_has_event_detail).permit(:activity_aspect_id, :event_detail_id)
    end
end
