class TripHasInventoryItemsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_trip_has_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /trip_has_inventory_items
  # GET /trip_has_inventory_items.json
  def index
    @trip_has_inventory_items = TripHasInventoryItem.all
  end

  # GET /trip_has_inventory_items/1
  # GET /trip_has_inventory_items/1.json
  def show
  end

  # GET /trip_has_inventory_items/new
  def new
    @trip_has_inventory_item = TripHasInventoryItem.new(:inventory_item_id => params[:item])
  end

  # GET /trip_has_inventory_items/1/edit
  def edit
  end

  # POST /trip_has_inventory_items
  # POST /trip_has_inventory_items.json
  def create
    @trip_has_inventory_item = TripHasInventoryItem.new(trip_has_inventory_item_params)

    respond_to do |format|
      if @trip_has_inventory_item.save
        format.html { redirect_to @trip_has_inventory_item, notice: 'Trip has inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @trip_has_inventory_item }
      else
        format.html { render :new }
        format.json { render json: @trip_has_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_has_inventory_items/1
  # PATCH/PUT /trip_has_inventory_items/1.json
  def update
    respond_to do |format|
      if @trip_has_inventory_item.update(trip_has_inventory_item_params)
        format.html { redirect_to @trip_has_inventory_item, notice: 'Trip has inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_has_inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @trip_has_inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_has_inventory_items/1
  # DELETE /trip_has_inventory_items/1.json
  def destroy
    @trip_has_inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to trip_has_inventory_items_url, notice: 'Trip has inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # DELETE /trip_has_inventory_items/1
  # DELETE /trip_has_inventory_items/1.json
  def remove
    @trip_has_inventory_item.destroy
    render :nothing
    # respond_to do |format|
    #   format.html { redirect_to trip_has_inventory_items_url, notice: 'Trip has inventory item was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_has_inventory_item
      @trip_has_inventory_item = TripHasInventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_has_inventory_item_params
      params.require(:trip_has_inventory_item).permit(:trip_id, :inventory_item_id, :date, :amount, :item)
    end
end
