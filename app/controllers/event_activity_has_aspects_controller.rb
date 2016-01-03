class EventActivityHasAspectsController < ApplicationController
  before_action :set_event_activity_has_aspect, only: [:show, :edit, :update, :destroy]

  # GET /event_activity_has_aspects
  # GET /event_activity_has_aspects.json
  def index
    @event_activity_has_aspects = EventActivityHasAspect.all
  end

  # GET /event_activity_has_aspects/1
  # GET /event_activity_has_aspects/1.json
  def show
  end

  # GET /event_activity_has_aspects/new
  def new
    @event_activity_has_aspect = EventActivityHasAspect.new
  end

  # GET /event_activity_has_aspects/1/edit
  def edit
  end

  # POST /event_activity_has_aspects
  # POST /event_activity_has_aspects.json
  def create
    @event_activity_has_aspect = EventActivityHasAspect.new(event_activity_has_aspect_params)

    respond_to do |format|
      if @event_activity_has_aspect.save
        format.html { redirect_to @event_activity_has_aspect, notice: 'Event activity has aspect was successfully created.' }
        format.json { render :show, status: :created, location: @event_activity_has_aspect }
      else
        format.html { render :new }
        format.json { render json: @event_activity_has_aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_activity_has_aspects/1
  # PATCH/PUT /event_activity_has_aspects/1.json
  def update
    respond_to do |format|
      if @event_activity_has_aspect.update(event_activity_has_aspect_params)
        format.html { redirect_to @event_activity_has_aspect, notice: 'Event activity has aspect was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_activity_has_aspect }
      else
        format.html { render :edit }
        format.json { render json: @event_activity_has_aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_activity_has_aspects/1
  # DELETE /event_activity_has_aspects/1.json
  def destroy
    @event_activity_has_aspect.destroy
    respond_to do |format|
      format.html { redirect_to event_activity_has_aspects_url, notice: 'Event activity has aspect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity_has_aspect
      @event_activity_has_aspect = EventActivityHasAspect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_has_aspect_params
      params.require(:event_activity_has_aspect).permit(:event_activity_id, :planning_aspect_id)
    end
end
