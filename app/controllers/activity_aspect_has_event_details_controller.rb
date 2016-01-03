class ActivityAspectHasEventDetailsController < ApplicationController
  before_action :set_activity_aspect_has_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /activity_aspect_has_event_details
  # GET /activity_aspect_has_event_details.json
  def index
    @activity_aspect_has_event_details = ActivityAspectHasEventDetail.all
  end

  # GET /activity_aspect_has_event_details/1
  # GET /activity_aspect_has_event_details/1.json
  def show
  end

  # GET /activity_aspect_has_event_details/new
  def new
    @activity_aspect_has_event_detail = ActivityAspectHasEventDetail.new
    @activity_aspect = EventActivityHasAspect.find(params[:has_aspect])
  end

  # GET /activity_aspect_has_event_details/1/edit
  def edit
  end

  # POST /activity_aspect_has_event_details
  # POST /activity_aspect_has_event_details.json
  def create
    @activity_aspect_has_event_detail = ActivityAspectHasEventDetail.new(activity_aspect_has_event_detail_params)

    respond_to do |format|
      if @activity_aspect_has_event_detail.save
        format.html { redirect_to @activity_aspect_has_event_detail, notice: 'Activity aspect has event detail was successfully created.' }
        format.json { render :show, status: :created, location: @activity_aspect_has_event_detail }
      else
        format.html { render :new }
        format.json { render json: @activity_aspect_has_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_aspect_has_event_details/1
  # PATCH/PUT /activity_aspect_has_event_details/1.json
  def update
    respond_to do |format|
      if @activity_aspect_has_event_detail.update(activity_aspect_has_event_detail_params)
        format.html { redirect_to @activity_aspect_has_event_detail, notice: 'Activity aspect has event detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_aspect_has_event_detail }
      else
        format.html { render :edit }
        format.json { render json: @activity_aspect_has_event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_aspect_has_event_details/1
  # DELETE /activity_aspect_has_event_details/1.json
  def destroy
    @activity_aspect_has_event_detail.destroy
    respond_to do |format|
      format.html { redirect_to activity_aspect_has_event_details_url, notice: 'Activity aspect has event detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_aspect_has_event_detail
      @activity_aspect_has_event_detail = ActivityAspectHasEventDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_aspect_has_event_detail_params
      params.require(:activity_aspect_has_event_detail).permit(:activity_aspect_id, :event_detail_id)
    end
end
