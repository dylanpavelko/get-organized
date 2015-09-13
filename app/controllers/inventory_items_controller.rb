class InventoryItemsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /inventory_items
  # GET /inventory_items.json
  def index
    @inventory_items = InventoryItem.all
    @clothes_category = Category.where(:category => "Clothing").first
    @electronics_category = Category.where(:category => "Electronics").first
    @food_category = Category.where(:category => "Food").first
    @clothes = @inventory_items.where(:category_id => @clothes_category)
    @electronics = @inventory_items.where(:category_id => @electronics_category)
    @food = @inventory_items.where(:category_id => @food_category)
    @miscellaneous = @inventory_items.where(:category_id => nil)
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
    @clothes_category = Category.where(:category => "Clothing").first
    @electronics_category = Category.where(:category => "Electronics").first
    @food_category = Category.where(:category => "Food").first
    @clothes = @inventory_items.select { |item| item.category == @clothes_category }#.where(:category_id => )
    @electronics = @inventory_items.select { |item| item.category == @electronics_category }#.where(:category_id => @electronics_category)
    @food = @inventory_items.select { |item| item.category == @food_category }#.where(:category_id => @food_category)
    @miscellaneous = @inventory_items.select { |item| item.category == nil }#.where(:category_id => nil)
  end

  # GET /inventory_items/1
  # GET /inventory_items/1.json
  def show
    @trip_items = TripHasInventoryItem.where(:inventory_item_id => @inventory_item)
    @activity_items = ActivityHasInventoryItem.where(:inventory_item_id => @inventory_item)
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

    respond_to do |format|
      if @inventory_item.save
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = InventoryItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through. 
    def inventory_item_params
      params.require(:inventory_item).permit(:name, :amazon_link, :quantity_type_id, :consumable, :price, :purchase_date, :note, :detail, :brand, :category_id, :subcategory_id)
    end
end
