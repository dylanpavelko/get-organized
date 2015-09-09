class AttractionCategoriesController < ApplicationController
  before_action :set_attraction_category, only: [:show, :edit, :update, :destroy]

  # GET /attraction_categories
  # GET /attraction_categories.json
  def index
    @attraction_categories = AttractionCategory.all
  end

  # GET /attraction_categories/1
  # GET /attraction_categories/1.json
  def show
  end

  # GET /attraction_categories/new
  def new
    @attraction_category = AttractionCategory.new
  end

  # GET /attraction_categories/1/edit
  def edit
  end

  # POST /attraction_categories
  # POST /attraction_categories.json
  def create
    @attraction_category = AttractionCategory.new(attraction_category_params)

    respond_to do |format|
      if @attraction_category.save
        format.html { redirect_to @attraction_category, notice: 'Attraction category was successfully created.' }
        format.json { render :show, status: :created, location: @attraction_category }
      else
        format.html { render :new }
        format.json { render json: @attraction_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attraction_categories/1
  # PATCH/PUT /attraction_categories/1.json
  def update
    respond_to do |format|
      if @attraction_category.update(attraction_category_params)
        format.html { redirect_to @attraction_category, notice: 'Attraction category was successfully updated.' }
        format.json { render :show, status: :ok, location: @attraction_category }
      else
        format.html { render :edit }
        format.json { render json: @attraction_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attraction_categories/1
  # DELETE /attraction_categories/1.json
  def destroy
    @attraction_category.destroy
    respond_to do |format|
      format.html { redirect_to attraction_categories_url, notice: 'Attraction category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_category
      @attraction_category = AttractionCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_category_params
      params.require(:attraction_category).permit(:name)
    end
end
