class RecipesController < ApplicationController
    before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @instructions = RecipeStep.where(:recipe_id => @recipe.id)
    @ingredients = RecipeIngredient.where(:recipe_id => @recipe.id)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @instructions = Array.new
  end

  # GET /recipes/1/edit
  def edit
    @instructions = RecipeStep.where(:recipe_id => @recipe.id)
    @ingredients = RecipeIngredient.where(:recipe_id => @recipe.id)
  end

  def sync_recipe
    if params[:id] == nil or params[:id] == ""
      @recipe = Recipe.new(:name => params[:title], :serving_size => params[:serving_size], :source => params[:source], :description => params[:description], 
        :notes => params[:notes], :author => params[:author])
      @recipe.save
    else
      @recipe = Recipe.find(params[:id])
      @recipe.update(:name => params[:title], :serving_size => params[:serving_size], :source => params[:source], :description => params[:description], 
        :notes => params[:notes], :author_id => params[:author_id])
    end

    #get all ingredients for recipe, delete them
    @ingredients = RecipeIngredient.where(:recipe_id => @recipe.id)
    @ingredients.each do |ing|
      ing.destroy
    end
    #now create all these new ingredients for recipe
    @amounts = params[:ingredient_amounts] 
    @quantity_types = params[:ingredient_quantity_types] 
    @food_items = params[:ingredient_food_items]
    @notes = params[:ingredient_notes]  
    @food_items.each_with_index do |inst, i|
      if i != @food_items.size - 1
        @ingredient = RecipeIngredient.new(:recipe_id => @recipe.id, :amount => @amounts[i], 
        :quantity_type_id => @quantity_types[i],
        :food_item_id => @food_items[i],
        :note => @notes[i])
        @ingredient.save
      end
    end

    #get all instructions for recipe, delete them
    @instructions = RecipeStep.where(:recipe_id => @recipe.id)
    @instructions.each do |inst|
      inst.destroy
    end
    #now create all these new instructions for recipe
    @instructions = params[:instructions]  
    @instructions.each_with_index do |inst, i|
      @instruction = RecipeStep.new(:recipe_id => @recipe.id, :instruction => inst)
      if i != @instructions.size - 1
        @instruction.save
      end
    end

    render json: @recipe
  end


  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :serving_size, :description, :source, :notes, :author_id,
       :instructions, :ingredient_amounts, :ingredient_quantity_types, :ingredient_food_items, :picture_id)
    end
end
