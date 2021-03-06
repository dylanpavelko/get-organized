class StockSalesController < ApplicationController
  before_action :authenticate_user
  before_action :authorized_only
  before_action :set_stock_sale, only: [:show, :edit, :update, :destroy]

  # GET /stock_sales
  # GET /stock_sales.json
  def index
    @stock_sales = StockSale.all
  end

  # GET /stock_sales/1
  # GET /stock_sales/1.json
  def show
  end

  # GET /stock_sales/new
  def new
    if params[:award] != nil
      @stock_award = StockAward.find(params[:award])
      @stock_sale = StockSale.new(:stock_award_id => @stock_award.id)
    elsif params[:purchase] != nil
      @stock_purchase = StockPurchase.find(params[:purchase])
      @stock_sale = StockSale.new
    else
      @stock_sale = StockSale.new
    end
    
  end

  # GET /stock_sales/1/edit
  def edit
    @stock_award = @stock_sale.stock_award
  end

  # POST /stock_sales
  # POST /stock_sales.json
  def create
    @stock_sale = StockSale.new(stock_sale_params)

    respond_to do |format|
      if @stock_sale.save
        format.html { redirect_to @stock_sale, notice: 'Stock sale was successfully created.' }
        format.json { render :show, status: :created, location: @stock_sale }
      else
        format.html { render :new }
        format.json { render json: @stock_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_sales/1
  # PATCH/PUT /stock_sales/1.json
  def update
    respond_to do |format|
      if @stock_sale.update(stock_sale_params)
        format.html { redirect_to @stock_sale, notice: 'Stock sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_sale }
      else
        format.html { render :edit }
        format.json { render json: @stock_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_sales/1
  # DELETE /stock_sales/1.json
  def destroy
    @stock_sale.destroy
    respond_to do |format|
      format.html { redirect_to stock_sales_url, notice: 'Stock sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_sale
      @stock_sale = StockSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_sale_params
      params.require(:stock_sale).permit(:person_id, :stock_id, :stock_purchase_id, :stock_award_id, :trade_date, :price, :shares, :fees, :stock_award_vesting_id)
    end
end
