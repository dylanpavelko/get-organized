class ActivityHasExerciseCentersController < ApplicationController
  before_action :set_activity_has_exercise_center, only: [:show, :edit, :update, :destroy]

  # GET /activity_has_exercise_centers
  # GET /activity_has_exercise_centers.json
  def index
    @activity_has_exercise_centers = ActivityHasExerciseCenter.all
  end

  # GET /activity_has_exercise_centers/1
  # GET /activity_has_exercise_centers/1.json
  def show
  end

  # GET /activity_has_exercise_centers/new
  def new
    @activity_has_exercise_center = ActivityHasExerciseCenter.new
  end

  # GET /activity_has_exercise_centers/1/edit
  def edit
  end

  # POST /activity_has_exercise_centers
  # POST /activity_has_exercise_centers.json
  def create
    @activity_has_exercise_center = ActivityHasExerciseCenter.new(activity_has_exercise_center_params)

    respond_to do |format|
      if @activity_has_exercise_center.save
        format.html { redirect_to @activity_has_exercise_center, notice: 'Activity has exercise center was successfully created.' }
        format.json { render :show, status: :created, location: @activity_has_exercise_center }
      else
        format.html { render :new }
        format.json { render json: @activity_has_exercise_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_has_exercise_centers/1
  # PATCH/PUT /activity_has_exercise_centers/1.json
  def update
    respond_to do |format|
      if @activity_has_exercise_center.update(activity_has_exercise_center_params)
        format.html { redirect_to @activity_has_exercise_center, notice: 'Activity has exercise center was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_has_exercise_center }
      else
        format.html { render :edit }
        format.json { render json: @activity_has_exercise_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_has_exercise_centers/1
  # DELETE /activity_has_exercise_centers/1.json
  def destroy
    @activity_has_exercise_center.destroy
    respond_to do |format|
      format.html { redirect_to activity_has_exercise_centers_url, notice: 'Activity has exercise center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_has_exercise_center
      @activity_has_exercise_center = ActivityHasExerciseCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_has_exercise_center_params
      params.require(:activity_has_exercise_center).permit(:activity_id, :exercise_center_id)
    end
end
