class StockAwardVestingsController < ApplicationController
  before_action :set_stock_award_vesting, only: [:show, :edit, :update, :destroy]
      before_filter :authenticate_user
  before_filter :authorized_only
  

  # GET /stock_award_vestings
  # GET /stock_award_vestings.json
  def index
    @stock_award_vestings = StockAwardVesting.all
  end

  # GET /stock_award_vestings/1
  # GET /stock_award_vestings/1.json
  def show
  end

  # GET /stock_award_vestings/new
  def new
    @stock_award_vesting = StockAwardVesting.new(:stock_award_id => params[:format])
  end

  # GET /stock_award_vestings/1/edit
  def edit
  end

  # POST /stock_award_vestings
  # POST /stock_award_vestings.json
  def create
    @stock_award_vesting = StockAwardVesting.new(stock_award_vesting_params)

    respond_to do |format|
      if @stock_award_vesting.save
        format.html { redirect_to @stock_award_vesting.stock_award, notice: 'Stock award vesting was successfully created.' }
        format.json { render :show, status: :created, location: @stock_award_vesting }
      else
        format.html { render :new }
        format.json { render json: @stock_award_vesting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_award_vestings/1
  # PATCH/PUT /stock_award_vestings/1.json
  def update
    respond_to do |format|
      if @stock_award_vesting.update(stock_award_vesting_params)
        format.html { redirect_to @stock_award_vesting.stock_award, notice: 'Stock award vesting was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_award_vesting }
      else
        format.html { render :edit }
        format.json { render json: @stock_award_vesting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_award_vestings/1
  # DELETE /stock_award_vestings/1.json
  def destroy
    @stock_award_vesting.destroy
    respond_to do |format|
      format.html { redirect_to stock_award_vestings_url, notice: 'Stock award vesting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_award_vesting
      @stock_award_vesting = StockAwardVesting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_award_vesting_params
      params.require(:stock_award_vesting).permit(:stock_award_id, :vest_date, :vest_quantity)
    end
end
