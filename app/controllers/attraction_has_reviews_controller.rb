class AttractionHasReviewsController < ApplicationController
  before_action :set_attraction_has_review, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user
  before_action :authorized_only

  # GET /attraction_has_reviews
  # GET /attraction_has_reviews.json
  def index
    @attraction_has_reviews = AttractionHasReview.all
  end

  # GET /attraction_has_reviews/1
  # GET /attraction_has_reviews/1.json
  def show
  end

  # GET /attraction_has_reviews/new
  def new
    @attraction_has_review = AttractionHasReview.new
  end

  # GET /attraction_has_reviews/1/edit
  def edit
  end

  # POST /attraction_has_reviews
  # POST /attraction_has_reviews.json
  def create
    @attraction_has_review = AttractionHasReview.new(attraction_has_review_params)

    respond_to do |format|
      if @attraction_has_review.save
        format.html { redirect_to @attraction_has_review, notice: 'Attraction has review was successfully created.' }
        format.json { render :show, status: :created, location: @attraction_has_review }
      else
        format.html { render :new }
        format.json { render json: @attraction_has_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attraction_has_reviews/1
  # PATCH/PUT /attraction_has_reviews/1.json
  def update
    respond_to do |format|
      if @attraction_has_review.update(attraction_has_review_params)
        format.html { redirect_to @attraction_has_review, notice: 'Attraction has review was successfully updated.' }
        format.json { render :show, status: :ok, location: @attraction_has_review }
      else
        format.html { render :edit }
        format.json { render json: @attraction_has_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attraction_has_reviews/1
  # DELETE /attraction_has_reviews/1.json
  def destroy
    @attraction_has_review.destroy
    respond_to do |format|
      format.html { redirect_to attraction_has_reviews_url, notice: 'Attraction has review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction_has_review
      @attraction_has_review = AttractionHasReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attraction_has_review_params
      params.require(:attraction_has_review).permit(:attraction_id, :review_id)
    end
end
