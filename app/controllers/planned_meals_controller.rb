class PlannedMealsController < ApplicationController
  before_action :authenticate_user
  before_action :authorized_only

  before_action :set_planned_meal, only: [:show, :edit, :update, :destroy]

  # GET /planned_meals
  # GET /planned_meals.json
  def index
    @planned_meals = PlannedMeal.all
    
    @days = Array.new
    #get date
    @plan_date = Date.today
    @search_date = @plan_date
    #for next 7 days
    7.times do
      #make an array of just Dinner
      @dinner_meals = PlannedMeal.where(:meal_date => @search_date, :meal_type => 1)
      #make an array of just Lunch
      @lunch_meals = PlannedMeal.where(:meal_date => @search_date, :meal_type => 2)
      #make an array of just Breakfast
      @breakfast_meals = PlannedMeal.where(:meal_date => @search_date, :meal_type => 3)
      #make an array of just Snacks
      @snack_meals = PlannedMeal.where(:meal_date => @search_date, :meal_type => 4)

      #add day array to days array
      @days << ({breakfast: @breakfast_meals, lunch: @lunch_meals, dinner: @dinner_meals, snacks: @snack_meals})
      
      #increase date
      @search_date = @search_date + 1
    end
  end

  # GET /planned_meals/1
  # GET /planned_meals/1.json
  def show
  end

  # GET /planned_meals/new
  def new
    @planned_meal = PlannedMeal.new
    @original_meals = PlannedMeal.where(planned_meal: nil)
  end

  # GET /planned_meals/1/edit
  def edit
    @original_meals = PlannedMeal.where(planned_meal: nil)
  end

  # POST /planned_meals
  # POST /planned_meals.json
  def create
    @planned_meal = PlannedMeal.new(planned_meal_params)

    respond_to do |format|
      if @planned_meal.save
        format.html { redirect_to @planned_meal, notice: 'Planned meal was successfully created.' }
        format.json { render :show, status: :created, location: @planned_meal }
      else
        format.html { render :new }
        format.json { render json: @planned_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planned_meals/1
  # PATCH/PUT /planned_meals/1.json
  def update
    respond_to do |format|
      if @planned_meal.update(planned_meal_params)
        format.html { redirect_to @planned_meal, notice: 'Planned meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @planned_meal }
      else
        format.html { render :edit }
        format.json { render json: @planned_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planned_meals/1
  # DELETE /planned_meals/1.json
  def destroy
    @planned_meal.destroy
    respond_to do |format|
      format.html { redirect_to planned_meals_url, notice: 'Planned meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planned_meal
      @planned_meal = PlannedMeal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planned_meal_params
      params.require(:planned_meal).permit(:meal_date, :meal_type, :text, :eat_out, :url, :recipe_id, :attraction_id, :left_overs, :planned_meal_id, :food_item_id, :comment, :order)
    end
end
