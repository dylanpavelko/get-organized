class PublicInventoryItemQueuesController < ApplicationController
  before_action :set_public_inventory_item_queue, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user
  before_filter :authorized_only, only: [:edit, :destroy]

  # GET /public_inventory_item_queues
  # GET /public_inventory_item_queues.json
  def index
    @public_inventory_item_queues = PublicInventoryItemQueue.all
  end

  # GET /public_inventory_item_queues/1
  # GET /public_inventory_item_queues/1.json
  def show
  end

  # GET /public_inventory_item_queues/new
  def new
    @public_inventory_item_queue = PublicInventoryItemQueue.new
  end

  # GET /public_inventory_item_queues/1/edit
  def edit
  end

  # POST /public_inventory_item_queues
  # POST /public_inventory_item_queues.json
  def create
    @public_inventory_item_queue = PublicInventoryItemQueue.new(public_inventory_item_queue_params)

    respond_to do |format|
      if @public_inventory_item_queue.save
        format.html { redirect_to @public_inventory_item_queue, notice: 'Public inventory item queue was successfully created.' }
        format.json { render :show, status: :created, location: @public_inventory_item_queue }
      else
        format.html { render :new }
        format.json { render json: @public_inventory_item_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_inventory_item_queues/1
  # PATCH/PUT /public_inventory_item_queues/1.json
  def update
    respond_to do |format|
      if @public_inventory_item_queue.update(public_inventory_item_queue_params)
        format.html { redirect_to @public_inventory_item_queue, notice: 'Public inventory item queue was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_inventory_item_queue }
      else
        format.html { render :edit }
        format.json { render json: @public_inventory_item_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_inventory_item_queues/1
  # DELETE /public_inventory_item_queues/1.json
  def destroy
    @public_inventory_item_queue.destroy
    respond_to do |format|
      format.html { redirect_to public_inventory_item_queues_url, notice: 'Public inventory item queue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_inventory_item_queue
      @public_inventory_item_queue = PublicInventoryItemQueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_inventory_item_queue_params
      params.require(:public_inventory_item_queue).permit(:item_id, :reviewed)
    end
end
