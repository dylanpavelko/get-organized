class LoyaltyProgramsController < ApplicationController
  before_filter :authenticate_user
  before_filter :authorized_only

  before_action :set_loyalty_program, only: [:show, :edit, :update, :destroy]

  # GET /loyalty_programs
  # GET /loyalty_programs.json
  def index
    @loyalty_programs = LoyaltyProgram.all
  end

  # GET /loyalty_programs/1
  # GET /loyalty_programs/1.json
  def show
  end

  # GET /loyalty_programs/new
  def new
    @loyalty_program = LoyaltyProgram.new
  end

  # GET /loyalty_programs/1/edit
  def edit
  end

  # POST /loyalty_programs
  # POST /loyalty_programs.json
  def create
    @loyalty_program = LoyaltyProgram.new(loyalty_program_params)

    respond_to do |format|
      if @loyalty_program.save
        format.html { redirect_to @loyalty_program, notice: 'Loyalty program was successfully created.' }
        format.json { render :show, status: :created, location: @loyalty_program }
      else
        format.html { render :new }
        format.json { render json: @loyalty_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loyalty_programs/1
  # PATCH/PUT /loyalty_programs/1.json
  def update
    respond_to do |format|
      if @loyalty_program.update(loyalty_program_params)
        format.html { redirect_to @loyalty_program, notice: 'Loyalty program was successfully updated.' }
        format.json { render :show, status: :ok, location: @loyalty_program }
      else
        format.html { render :edit }
        format.json { render json: @loyalty_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loyalty_programs/1
  # DELETE /loyalty_programs/1.json
  def destroy
    @loyalty_program.destroy
    respond_to do |format|
      format.html { redirect_to loyalty_programs_url, notice: 'Loyalty program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loyalty_program
      @loyalty_program = LoyaltyProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loyalty_program_params
      params.require(:loyalty_program).permit(:name, :number, :username, :image)
    end
end
