class StockAwardsController < ApplicationController
  before_action :set_stock_award, only: [:show, :edit, :update, :destroy]

     before_filter :authenticate_user
  before_filter :authorized_only

  # GET /stock_awards
  # GET /stock_awards.json
  def index
    @stock_awards = StockAward.all
  end

  # GET /stock_awards/1
  # GET /stock_awards/1.json
  def show
    @vestings = StockAwardVesting.where(:stock_award => @stock_award)
    @purchases = StockPurchase.where(:stock_award => @stock_award)
    @sales = StockSale.where(:stock_award => @stock_award)

    @transactions = @vestings + @sales + @purchases
    @transactions = @transactions.sort! { |a,b| a.date <=> b.date }
  end

  # GET /stock_awards/new
  def new
    @stock_award = StockAward.new
  end

  # GET /stock_awards/1/edit
  def edit
  end

  # POST /stock_awards
  # POST /stock_awards.json
  def create
    @stock_award = StockAward.new(stock_award_params)

    respond_to do |format|
      if @stock_award.save
        format.html { redirect_to @stock_award, notice: 'Stock award was successfully created.' }
        format.json { render :show, status: :created, location: @stock_award }
      else
        format.html { render :new }
        format.json { render json: @stock_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_awards/1
  # PATCH/PUT /stock_awards/1.json
  def update
    respond_to do |format|
      if @stock_award.update(stock_award_params)
        format.html { redirect_to @stock_award, notice: 'Stock award was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_award }
      else
        format.html { render :edit }
        format.json { render json: @stock_award.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_awards/1
  # DELETE /stock_awards/1.json
  def destroy
    @stock_award.destroy
    respond_to do |format|
      format.html { redirect_to stock_awards_url, notice: 'Stock award was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_award
      @stock_award = StockAward.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_award_params
      params.require(:stock_award).permit(:award_id, :person_id, :stock_id, :award_type_id, :award_date, :shares, :grant_price)
    end
end
