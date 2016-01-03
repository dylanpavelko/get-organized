class PlanningAspectsController < ApplicationController
  before_action :set_planning_aspect, only: [:show, :edit, :update, :destroy]

  # GET /planning_aspects
  # GET /planning_aspects.json
  def index
    @planning_aspects = PlanningAspect.all
  end

  # GET /planning_aspects/1
  # GET /planning_aspects/1.json
  def show
  end

  # GET /planning_aspects/new
  def new
    @planning_aspect = PlanningAspect.new
  end

  # GET /planning_aspects/1/edit
  def edit
  end

  # POST /planning_aspects
  # POST /planning_aspects.json
  def create
    @planning_aspect = PlanningAspect.new(planning_aspect_params)

    respond_to do |format|
      if @planning_aspect.save
        format.html { redirect_to @planning_aspect, notice: 'Planning aspect was successfully created.' }
        format.json { render :show, status: :created, location: @planning_aspect }
      else
        format.html { render :new }
        format.json { render json: @planning_aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planning_aspects/1
  # PATCH/PUT /planning_aspects/1.json
  def update
    respond_to do |format|
      if @planning_aspect.update(planning_aspect_params)
        format.html { redirect_to @planning_aspect, notice: 'Planning aspect was successfully updated.' }
        format.json { render :show, status: :ok, location: @planning_aspect }
      else
        format.html { render :edit }
        format.json { render json: @planning_aspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planning_aspects/1
  # DELETE /planning_aspects/1.json
  def destroy
    @planning_aspect.destroy
    respond_to do |format|
      format.html { redirect_to planning_aspects_url, notice: 'Planning aspect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning_aspect
      @planning_aspect = PlanningAspect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planning_aspect_params
      params.require(:planning_aspect).permit(:name, :description, :event_type_id)
    end
end
