class InventoryItemsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    @inventory_items = InventoryItem.get_all_public_and_my_items(@current_user)
    @all_items = Array.new
    @categories = Category.all
    @categories.each do |category|
      puts category.category
      @category_items = @inventory_items.select { |item| item.category == category }
      if @category_items.count > 0
        @all_items << @category_items
      end
    end
    
    @miscellaneous = @inventory_items.select { |item| item.category == nil }
    @all_items << @miscellaneous
  end

  # GET /inventory_items
  # GET /inventory_items.json
  def my_inventory
    @current_person = Person.where(:user_account => @current_user)
    @my_items = InventoryOwner.where(:person => @current_person)
    @inventory_items = Array.new
    @my_items.each do |item|
      @inventory_items << item.inventory_item
    end
    
    @all_items = Array.new
    @categories = Category.all
    @categories.each do |category|
      puts category.category
      @category_items = @inventory_items.select { |item| item.category == category }
      if @category_items.count > 0
        @all_items << @category_items
      end
    end
    
    @miscellaneous = @inventory_items.select { |item| item.category == nil }
    @all_items << @miscellaneous
  end

  def publish
    @item = InventoryItem.where(:id => params[:id]).first
    @item.update(:public => true)
    @publish_requests = PublicInventoryItemQueue.where(:item_id => @item)
    @publish_requests.each do |request|
      request.update(:reviewed => true)
    end
    render json: @item
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
    @trip_items = TripHasInventoryItem.where(:inventory_item_id => @inventory_item)
    @activity_items = ActivityHasInventoryItem.where(:inventory_item_id => @inventory_item)

    @current_person = Person.where(:user_account => @current_user)
    @ownerships = InventoryOwner.where(:inventory_item_id => @inventory_item, :person => @current_person)

    @contains = InventoryOwner.where(:stored_in_id => @inventory_item)
    
    @transactions = Transaction.where(:inventory_item_id => @inventory_item)
  end

  # GET /inventory_items/new
  def new
    @inventory_item = InventoryItem.new
  end

  # GET /inventory_items/1/edit
  def edit
  end

  # POST /inventory_items
  # POST /inventory_items.json
  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    @person_id = params[:person_id]
    respond_to do |format|
      if @person_id != ''
        @owernship = InventoryOwner.new(:inventory_item => @inventory_item, :person_id => params[:person_id])
        @owernship.save
      end
      if @inventory_item.save
        if params[:inventory_item][:public_request] == "1"
          @request = PublicInventoryItemQueue.new(:item_id => @inventory_item.id, :reviewed => false)
          @request.save
        end
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_item }
      else
        format.html { render :new }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_items/1
  # PATCH/PUT /inventory_items/1.json
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        if (params[:inventory_item][:public_request] == "1") and PublicInventoryItemQueue.where(:item_id => @inventory_item.id, :reviewed => false).count < 1
          @request = PublicInventoryItemQueue.new(:item_id => @inventory_item.id, :reviewed => false)
          @request.save
        end
        format.html { redirect_to @inventory_item, notice: 'Inventory item was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_item }
      else
        format.html { render :edit }
        format.json { render json: @inventory_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_items/1
  # DELETE /inventory_items/1.json
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_items_url, notice: 'Inventory item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def instant_search_inventory
    @inventory_items = InventoryItem.all;
    @search_string = params[:search_string];
    @matched_items = Array.new
    @inventory_items.each do |item|
      if item.matches(@search_string)
        @matched_items << item
      end
    end
    @response = [@matched_items.count.to_s + ' item(s) found: for ' + @search_string]
    @matched_items.each do |item|
      @response << [item.full_name, item.id]
    end
    render json: @response
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. 
    def inventory_item_params
      params.require(:inventory_item).permit(:name, :amazon_link, :quantity_type_id, :consumable, :price, :purchase_date,
       :note, :detail, :brand, :category_id, :subcategory_id, :person_id, :container)
    end
end
