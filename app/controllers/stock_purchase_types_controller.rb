class StockPurchaseTypesController < ApplicationController
  before_action :set_stock_purchase_type, only: [:show, :edit, :update, :destroy]

  # GET /stock_purchase_types
  # GET /stock_purchase_types.json
  def index
    @stock_purchase_types = StockPurchaseType.all
  end

  # GET /stock_purchase_types/1
  # GET /stock_purchase_types/1.json
  def show
  end

  # GET /stock_purchase_types/new
  def new
    @stock_purchase_type = StockPurchaseType.new
  end

  # GET /stock_purchase_types/1/edit
  def edit
  end

  # POST /stock_purchase_types
  # POST /stock_purchase_types.json
  def create
    @stock_purchase_type = StockPurchaseType.new(stock_purchase_type_params)

    respond_to do |format|
      if @stock_purchase_type.save
        format.html { redirect_to @stock_purchase_type, notice: 'Stock purchase type was successfully created.' }
        format.json { render :show, status: :created, location: @stock_purchase_type }
      else
        format.html { render :new }
        format.json { render json: @stock_purchase_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_purchase_types/1
  # PATCH/PUT /stock_purchase_types/1.json
  def update
    respond_to do |format|
      if @stock_purchase_type.update(stock_purchase_type_params)
        format.html { redirect_to @stock_purchase_type, notice: 'Stock purchase type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_purchase_type }
      else
        format.html { render :edit }
        format.json { render json: @stock_purchase_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_purchase_types/1
  # DELETE /stock_purchase_types/1.json
  def destroy
    @stock_purchase_type.destroy
    respond_to do |format|
      format.html { redirect_to stock_purchase_types_url, notice: 'Stock purchase type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_purchase_type
      @stock_purchase_type = StockPurchaseType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_purchase_type_params
      params.require(:stock_purchase_type).permit(:name)
    end
end
