class ExerciseCentersController < ApplicationController
  before_action :authenticate_user
  before_action :authorized_only

  before_action :set_exercise_center, only: [:show, :edit, :update, :destroy]

  # GET /exercise_centers
  # GET /exercise_centers.json
  def index
    @exercise_centers = ExerciseCenter.all
  end

  # GET /exercise_centers/1
  # GET /exercise_centers/1.json
  def show
    @activity_has_centers = ActivityHasExerciseCenter.where(:exercise_center => @exercise_center)
  end

  # GET /exercise_centers/new
  def new
    @exercise_center = ExerciseCenter.new
  end

  # GET /exercise_centers/1/edit
  def edit
  end

  # POST /exercise_centers
  # POST /exercise_centers.json
  def create
    @exercise_center = ExerciseCenter.new(exercise_center_params)

    respond_to do |format|
      if @exercise_center.save
        format.html { redirect_to @exercise_center, notice: 'Exercise center was successfully created.' }
        format.json { render :show, status: :created, location: @exercise_center }
      else
        format.html { render :new }
        format.json { render json: @exercise_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercise_centers/1
  # PATCH/PUT /exercise_centers/1.json
  def update
    respond_to do |format|
      if @exercise_center.update(exercise_center_params)
        format.html { redirect_to @exercise_center, notice: 'Exercise center was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercise_center }
      else
        format.html { render :edit }
        format.json { render json: @exercise_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercise_centers/1
  # DELETE /exercise_centers/1.json
  def destroy
    @exercise_center.destroy
    respond_to do |format|
      format.html { redirect_to exercise_centers_url, notice: 'Exercise center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_center
      @exercise_center = ExerciseCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercise_center_params
      params.require(:exercise_center).permit(:gymType, :name, :site, :notes)
    end
end
