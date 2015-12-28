class StockPurchasesController < ApplicationController
  before_action :set_stock_purchase, only: [:show, :edit, :update, :destroy]
       before_filter :authenticate_user
  before_filter :authorized_only

  # GET /stock_purchases
  # GET /stock_purchases.json
  def index
    @stock_purchases = StockPurchase.all
  end

  # GET /stock_purchases/1
  # GET /stock_purchases/1.json
  def show
  end

  # GET /stock_purchases/new
  def new
    if(params[:format] != nil)
      @stock_award = StockAward.find(params[:format])
      @stock_purchase = StockPurchase.new(:stock_id => @stock_award.stock.id, :stock_award_id => @stock_award.id)
    else
      @stock_purchase = StockPurchase.new
    end
  end

  # GET /stock_purchases/1/edit
  def edit
  end

  # POST /stock_purchases
  # POST /stock_purchases.json
  def create
    @stock_purchase = StockPurchase.new(stock_purchase_params)

    respond_to do |format|
      if @stock_purchase.save
        format.html { redirect_to @stock_purchase, notice: 'Stock purchase was successfully created.' }
        format.json { render :show, status: :created, location: @stock_purchase }
      else
        format.html { render :new }
        format.json { render json: @stock_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_purchases/1
  # PATCH/PUT /stock_purchases/1.json
  def update
    respond_to do |format|
      if @stock_purchase.update(stock_purchase_params)
        format.html { redirect_to @stock_purchase, notice: 'Stock purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_purchase }
      else
        format.html { render :edit }
        format.json { render json: @stock_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_purchases/1
  # DELETE /stock_purchases/1.json
  def destroy
    @stock_purchase.destroy
    respond_to do |format|
      format.html { redirect_to stock_purchases_url, notice: 'Stock purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_purchase
      @stock_purchase = StockPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_purchase_params
      params.require(:stock_purchase).permit(:person_id, :stock_id, :stock_purchase_type_id, :stock_award_id, :grant_date, :grant_date_price, :shares, :acquired_date, :acquired_price, :acquired_fmv)
    end
end
