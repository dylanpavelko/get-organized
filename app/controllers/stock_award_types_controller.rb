class StockAwardTypesController < ApplicationController
  before_action :set_stock_award_type, only: [:show, :edit, :update, :destroy]

     before_filter :authenticate_user
  before_filter :authorized_only

  # GET /stock_award_types
  # GET /stock_award_types.json
  def index
    @stock_award_types = StockAwardType.all
  end

  # GET /stock_award_types/1
  # GET /stock_award_types/1.json
  def show
  end

  # GET /stock_award_types/new
  def new
    @stock_award_type = StockAwardType.new
  end

  # GET /stock_award_types/1/edit
  def edit
  end

  # POST /stock_award_types
  # POST /stock_award_types.json
  def create
    @stock_award_type = StockAwardType.new(stock_award_type_params)

    respond_to do |format|
      if @stock_award_type.save
        format.html { redirect_to @stock_award_type, notice: 'Stock award type was successfully created.' }
        format.json { render :show, status: :created, location: @stock_award_type }
      else
        format.html { render :new }
        format.json { render json: @stock_award_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_award_types/1
  # PATCH/PUT /stock_award_types/1.json
  def update
    respond_to do |format|
      if @stock_award_type.update(stock_award_type_params)
        format.html { redirect_to @stock_award_type, notice: 'Stock award type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_award_type }
      else
        format.html { render :edit }
        format.json { render json: @stock_award_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_award_types/1
  # DELETE /stock_award_types/1.json
  def destroy
    @stock_award_type.destroy
    respond_to do |format|
      format.html { redirect_to stock_award_types_url, notice: 'Stock award type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_award_type
      @stock_award_type = StockAwardType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_award_type_params
      params.require(:stock_award_type).permit(:name)
    end
end
