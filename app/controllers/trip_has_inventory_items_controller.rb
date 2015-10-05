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
        format.html { redirect_to @trip_has_inventory_item.trip, notice: 'Trip has inventory item was successfully updated.' }
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
  
  def pack_item
    @trip_item = TripHasInventoryItem.find(params[:id])
    @trip_item.update(:packed => true)
    @data = [ @trip_item, @trip_item.inventory_item.id, @trip_item.inventory_item.full_name]
    render json: @data
  end
  
  def pack_item_multiple
    @trip_item = TripHasInventoryItem.find(params[:id])
    @item = @trip_item.inventory_item
    
    if params[:all] == "true"
      #pack all trip items of inventory type
      @items = TripHasInventoryItem.where(:inventory_item_id => @item.id, :trip_id => @trip_item.trip_id)
      @items.each do |pack_item|
        pack_item.update(:packed => true)
      end
      @data = [ @trip_item, @trip_item.inventory_item.id, @trip_item.inventory_item.full_name, @items.count]
    else
      #find next right trip item to pack
      @unpacked = TripHasInventoryItem.where(:inventory_item_id => @item.id, :packed => false, :trip_id => @trip_item.trip_id)
      @unpacked_nil = TripHasInventoryItem.where(:inventory_item_id => @item.id, :packed => nil, :trip_id => @trip_item.trip_id)
      @unpacked = @unpacked + @unpacked_nil

      @unpacked_count = @unpacked.count

      @unpacked.first.update(:packed => true)
      @data = [ @trip_item, @trip_item.inventory_item.id, @trip_item.inventory_item.full_name, (@unpacked_count - 1)]
    end
   
    render json: @data
  end

  def select_trips_to_copy
    @my_trips = Trip.get_my_trips(@current_user)
  end

  def select_items_to_copy
    @source_trip = Trip.find(params[:source])
    @target_trip = Trip.find(params[:target])

    @source_items = TripHasInventoryItem.where(:trip_id => @source_trip.id)
    @target_items = TripHasInventoryItem.where(:trip_id => @target_trip.id)

    @unique_items = Array.new
    @source_items.each do |item|
      @unique_items << [item.inventory_item, @source_items.where(:inventory_item => item.inventory_item.id).count, @target_items.where(:inventory_item => item.inventory_item.id).count]
    end

  end

  def copy_selected_items_to_trip
    @target_trip = Trip.find(params[:trip_id])
    @payload = params[:payload]
    @payload.each do |data|
      puts "create " + data[1][1].to_s + " of " + data[1][0].to_s
      number = data[1][1]
      item_id = data[1][0]
      if number.to_i > 0
        number.to_i.times do
          @new_pack_item = TripHasInventoryItem.new(:trip_id => @target_trip.id, :inventory_item_id => item_id)
          @new_pack_item.save
        end 
      end
    end
    render json: @target_trip
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_has_inventory_item
      @trip_has_inventory_item = TripHasInventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_has_inventory_item_params
      params.require(:trip_has_inventory_item).permit(:trip_id, :inventory_item_id, :date, :amount, :item, :packed, :reused, :all)
    end
end
