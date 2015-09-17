class PeopleController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only, only: [:edit, :destroy]
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def header_search
    @search_string = params[:search_string];
    @response = Array.new

    #find matching tasks
    @tasks = Task.where(:search_indexed => true)
    @matched_items = Array.new
    @tasks.each do |item|
      if item.matches(@search_string) and item.user_has_access(@current_user)
        @matched_items << item
      end
    end
    @matched_items.each do |item|
      @response << [0, 'Task: ' + item.task_name, item.task_path]
    end

    #find matching items
    @inventory_items = InventoryItem.all;
    @matched_items = Array.new
    @inventory_items.each do |item|
      if item.matches(@search_string)
        @matched_items << item
      end
    end
    @matched_items.each do |item|
      @response << [1, 'Item: ' + item.full_name, item.id]
    end

    #find matching trips
    @trips = Trip.all;
    @matched_items = Array.new
    @trips.each do |item|
      if item.matches(@search_string)
        @matched_items << item
      end
    end
    @matched_items.each do |item|
      @response << [2, 'Trip: ' + item.name, item.id]
    end

    #find matching attractions
    @attractions = Attraction.all;
    @matched_items = Array.new
    @attractions.each do |item|
      if item.matches(@search_string)
        @matched_items << item
      end
    end
    @matched_items.each do |item|
      @response << [3, 'Attraction: ' + item.name, item.id]
    end

    @response << [@response.count.to_s + ' item(s) found: for ' + @search_string]
    render json: @response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :nick_name, :last_name, :user_account_id)
    end
end
