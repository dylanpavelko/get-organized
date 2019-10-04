class ActivityHasInventoryItemsController < ApplicationController
   before_action :authenticate_user
  before_action :authorized_only

 before_action :set_activity_has_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /activity_has_inventory_items
  # GET /activity_has_inventory_items.json
  def index
    @activity_has_inventory_items = ActivityHasInventoryItem.all
  end

  # GET /activity_has_inventory_items/1
  # GET /activity_has_inventory_items/1.json
  def show
  end

  # GET /activity_has_inventory_items/new
  def new
    @activity_has_inventory_item = ActivityHasInventoryItem.new
  end

  # GET /activity_has_inventory_items/1/edit
  def edit
  end

  # POST /activity_has_inventory_items
  # POST /activity_has_inventory_items.json
  def create
    @activity_has_inventory_item = ActivityHasInventoryItem.new(activity_has_inventory_item_params)

    respond_to do |format|
      if @activity_has_inventory_item.save
        format.html { redirect_to @activity_has_inventory_item, notice: 'Activity has inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @activity_has_inventory_item }
      else
        format.html { render :new }
        format.json { render json: @activity_has_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_has_inventory_items/1
  # PATCH/PUT /activity_has_inventory_items/1.json
  def update
    respond_to do |format|
      if @activity_has_inventory_item.update(activity_has_inventory_item_params)
        format.html { redirect_to @activity_has_inventory_item, notice: 'Activity has inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_has_inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @activity_has_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_has_inventory_items/1
  # DELETE /activity_has_inventory_items/1.json
  def destroy
    @activity_has_inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to activity_has_inventory_items_url, notice: 'Activity has inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_has_inventory_item
      @activity_has_inventory_item = ActivityHasInventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_has_inventory_item_params
      params.require(:activity_has_inventory_item).permit(:activity_id, :inventory_item_id)
    end
end
