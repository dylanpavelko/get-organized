class TripsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  require 'date'

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
    @past_trips = Array.new
    @upcoming_trips = Array.new
    @future_trips = Array.new
    @trips.each do |trip|
      if trip.last_date == ''
        @future_trips << trip
      elsif Date.parse(trip.last_date).past?
        @past_trips << trip
      else
        @upcoming_trips << trip
      end
    end
    @past_trips = @past_trips.sort {|a,b| Date.parse(a.first_date) <=> Date.parse(b.first_date)}
    @future_trips = @future_trips.sort {|a,b| Date.parse(a.first_date) <=> Date.parse(b.first_date)}
  end

  # GET /trips/1
  # GET /trips/1.json
  def show

     @trip_items = TripHasInventoryItem.where(:trip_id => @trip)
     
     @trip_activities = ItineraryActivity.where(:trip_id => @trip).order(:datetime)
     @no_date_activities = Array.new
     @itinerary_rows = Array.new
          @trip_activities.each do |activity|
            if activity.datetime != nil
              activity.get_itinerary_rows.each do |row|
                @itinerary_rows << row
              end
            else
              @no_date_activities << activity
            end
          end


     @itinerary_rows = @itinerary_rows.sort_by {|obj| obj.datetime}

     @days = Array.new
     @activities=Array.new
     
     @itinerary_rows.each do |activity| 
       if(activity.date != nil)
          if (@activities.count == 0 ) or (@activities.last.date == activity.date)
            @activities << activity
          else
            @days << @activities
            @activities = Array.new
            @activities << activity

          end
      else
        @no_date_activities << activity
      end
    end
     @days << @activities



    
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update 
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_item_to_trip
    @trip_has_inventory_item = TripHasInventoryItem.new(:trip_id => params[:trip_id],
                                                        :inventory_item_id => params[:inventory_item_id],
                                                        :amount => params[:amount])
    @trip_has_inventory_item.save
    @response = [@trip_has_inventory_item.inventory_item.full_name, @trip_has_inventory_item.inventory_item_id]
    render json: @response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :description, :blog_link, :photo_link, :tripit_link)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_has_inventory_item_params
      params.require(:trip_has_inventory_item).permit(:trip_id, :inventory_item_id, :date, :amount)
    end
end
