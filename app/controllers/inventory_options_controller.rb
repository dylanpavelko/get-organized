class InventoryOptionsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only
  
  before_action :set_inventory_option, only: [:show, :edit, :update, :destroy]

  # GET /inventory_options
  # GET /inventory_options.json
  def index
    @inventory_options = InventoryOption.all
  end

  # GET /inventory_options/1
  # GET /inventory_options/1.json
  def show
  end

  # GET /inventory_options/new
  def new
    @inventory_option = InventoryOption.new
  end

  # GET /inventory_options/1/edit
  def edit
  end

  # POST /inventory_options
  # POST /inventory_options.json
  def create
    @inventory_option = InventoryOption.new(inventory_option_params)

    respond_to do |format|
      if @inventory_option.save
        format.html { redirect_to @inventory_option, notice: 'Inventory option was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_option }
      else
        format.html { render :new }
        format.json { render json: @inventory_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_options/1
  # PATCH/PUT /inventory_options/1.json
  def update
    respond_to do |format|
      if @inventory_option.update(inventory_option_params)
        format.html { redirect_to @inventory_option, notice: 'Inventory option was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_option }
      else
        format.html { render :edit }
        format.json { render json: @inventory_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_options/1
  # DELETE /inventory_options/1.json
  def destroy
    @inventory_option.destroy
    respond_to do |format|
      format.html { redirect_to inventory_options_url, notice: 'Inventory option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_option
      @inventory_option = InventoryOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_option_params
      params.require(:inventory_option).permit(:inventory_item_id, :food_items_id)
    end
end
