class TripHasParticipantsController < ApplicationController
  before_action :set_trip_has_participant, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user
  before_action :authorized_only

  # GET /trip_has_participants
  # GET /trip_has_participants.json
  def index
    @trip_has_participants = TripHasParticipant.all
  end

  # GET /trip_has_participants/1
  # GET /trip_has_participants/1.json
  def show
  end

  # GET /trip_has_participants/new
  def new
    @trip_has_participant = TripHasParticipant.new
    @trip = Trip.where(:id => params[:format]).first
  end

  # GET /trip_has_participants/1/edit
  def edit
    @trip = Trip.where(:id => @trip_has_participant.trip).first
  end

  # POST /trip_has_participants
  # POST /trip_has_participants.json
  def create
    @trip_has_participant = TripHasParticipant.new(trip_has_participant_params)

    respond_to do |format|
      if @trip_has_participant.save
        format.html { redirect_to @trip_has_participant, notice: 'Trip has participant was successfully created.' }
        format.json { render :show, status: :created, location: @trip_has_participant }
      else
        format.html { render :new }
        format.json { render json: @trip_has_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_has_participants/1
  # PATCH/PUT /trip_has_participants/1.json
  def update
    respond_to do |format|
      if @trip_has_participant.update(trip_has_participant_params)
        format.html { redirect_to @trip_has_participant, notice: 'Trip has participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_has_participant }
      else
        format.html { render :edit }
        format.json { render json: @trip_has_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_has_participants/1
  # DELETE /trip_has_participants/1.json
  def destroy
    @trip_has_participant.destroy
    respond_to do |format|
      format.html { redirect_to trip_has_participants_url, notice: 'Trip has participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_has_participant
      @trip_has_participant = TripHasParticipant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_has_participant_params
      params.require(:trip_has_participant).permit(:participant_id, :organizer, :private_viewer, :traveler, :trip_id)
    end
end
