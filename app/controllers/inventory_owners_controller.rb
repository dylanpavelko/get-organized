class InventoryOwnersController < ApplicationController
  before_action :authenticate_user
  before_action :authorized_only

  before_action :set_inventory_owner, only: [:show, :edit, :update, :destroy]

  # GET /inventory_owners
  # GET /inventory_owners.json
  def index
    @inventory_owners = InventoryOwner.all
  end

  # GET /inventory_owners/1
  # GET /inventory_owners/1.json
  def show
  end

  # GET /inventory_owners/new
  def new
    @inventory_owner = InventoryOwner.new(:inventory_item_id => params[:format])
  end

  # GET /inventory_owners/1/edit
  def edit
  end

  # POST /inventory_owners
  # POST /inventory_owners.json
  def create
    @inventory_owner = InventoryOwner.new(inventory_owner_params)

    respond_to do |format|
      if @inventory_owner.save
        format.html { redirect_to my_inventory_path, notice: 'Inventory owner was successfully created.' }
        format.json { render :show, status: :created, location: @inventory_owner }
      else
        format.html { render :new }
        format.json { render json: @inventory_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventory_owners/1
  # PATCH/PUT /inventory_owners/1.json
  def update
    respond_to do |format|
      if @inventory_owner.update(inventory_owner_params)
        format.html { redirect_to inventory_item_path(@inventory_owner.inventory_item), notice: 'Inventory item ownership was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory_owner }
      else
        format.html { render :edit }
        format.json { render json: @inventory_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_owners/1
  # DELETE /inventory_owners/1.json
  def destroy
    @inventory_owner.destroy
    respond_to do |format|
      format.html { redirect_to inventory_owners_url, notice: 'Inventory owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_owner
      @inventory_owner = InventoryOwner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_owner_params
      params.require(:inventory_owner).permit(:inventory_item_id, :amount, :quantity_type_id, :person_id, :stored_in_id)
    end
end
