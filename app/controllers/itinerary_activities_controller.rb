class ItineraryActivitiesController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_itinerary_activity, only: [:show, :edit, :update, :destroy]

  # GET /itinerary_activities
  # GET /itinerary_activities.json
  def index
    @itinerary_activities = ItineraryActivity.all
  end

  # GET /itinerary_activities/1
  # GET /itinerary_activities/1.json
  def show
  end

  # GET /itinerary_activities/new
  def new
    @itinerary_activity = ItineraryActivity.new(:trip_id => params[:format])
  end

  # GET /itinerary_activities/1/edit
  def edit
  end

  # POST /itinerary_activities
  # POST /itinerary_activities.json
  def create
    @itinerary_activity = ItineraryActivity.new(itinerary_activity_params)

    respond_to do |format|
      if @itinerary_activity.save
        format.html { redirect_to @itinerary_activity, notice: 'Itinerary activity was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary_activity }
      else
        format.html { render :new }
        format.json { render json: @itinerary_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerary_activities/1
  # PATCH/PUT /itinerary_activities/1.json
  def update
    respond_to do |format|
      if @itinerary_activity.update(itinerary_activity_params)
        format.html { redirect_to @itinerary_activity, notice: 'Itinerary activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerary_activity }
      else
        format.html { render :edit }
        format.json { render json: @itinerary_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerary_activities/1
  # DELETE /itinerary_activities/1.json
  def destroy
    @itinerary_activity.destroy
    respond_to do |format|
      format.html { redirect_to itinerary_activities_url, notice: 'Itinerary activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerary_activity
      @itinerary_activity = ItineraryActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerary_activity_params
      params.require(:itinerary_activity).permit(:name, :attraction_id, :cost, :basis_id, :datetime, :end, :order, :trip_id, :origination_id, :destination_id, :airline_id)
    end
end
