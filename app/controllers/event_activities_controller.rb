class EventActivitiesController < ApplicationController
  before_action :set_event_activity, only: [:show, :edit, :update, :destroy]

  # GET /event_activities
  # GET /event_activities.json
  def index
    @event_activities = EventActivity.all
  end

  # GET /event_activities/1
  # GET /event_activities/1.json
  def show
    @templates = EventTemplateHasEventActivity.where(:activities_id => @event_activity.id)
    @aspects = EventActivityHasAspect.where(:event_activity => @event_activity.id)
  end

  # GET /event_activities/new
  def new
    @event_activity = EventActivity.new
  end

  # GET /event_activities/1/edit
  def edit
  end

  # POST /event_activities
  # POST /event_activities.json
  def create
    @event_activity = EventActivity.new(event_activity_params)

    respond_to do |format|
      if @event_activity.save
        format.html { redirect_to @event_activity, notice: 'Event activity was successfully created.' }
        format.json { render :show, status: :created, location: @event_activity }
      else
        format.html { render :new }
        format.json { render json: @event_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_activities/1
  # PATCH/PUT /event_activities/1.json
  def update
    respond_to do |format|
      if @event_activity.update(event_activity_params)
        format.html { redirect_to @event_activity, notice: 'Event activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_activity }
      else
        format.html { render :edit }
        format.json { render json: @event_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_activities/1
  # DELETE /event_activities/1.json
  def destroy
    @event_activity.destroy
    respond_to do |format|
      format.html { redirect_to event_activities_url, notice: 'Event activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_activity
      @event_activity = EventActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_activity_params
      params.require(:event_activity).permit(:name)
    end
end
