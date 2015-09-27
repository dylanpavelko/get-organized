class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user
  before_filter :authorized_only

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @attraction = AttractionHasReview.where(:review_id => @review.id).first.attraction
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @attraction = Attraction.find(params[:format])
  end

  # GET /reviews/1/edit
  def edit
    @attraction = AttractionHasReview.where(:review_id => @review.id).first.attraction
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @comment = Comment.new(:body => params[:review][:comment], :author_id => @current_user.person_id)
    puts "current user"
    puts @current_user.username
    @comment.save
    
    @review = Review.new(:rating => params[:review][:rating], :public => params[:review][:public], :reviewer_id => @current_user.person_id)
    @attraction = Attraction.where(:id => params[:attraction][:id]).first
    respond_to do |format|
      if @review.save
        @review.update(:comment_id => @comment.id)
        @reviewForAttraction = AttractionHasReview.new(:attraction_id => @attraction.id, :review_id => @review.id)
        @reviewForAttraction.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(:rating => params[:review][:rating], :public => params[:review][:public])
        @comment = Comment.find(@review.comment)
        @comment.update(:body => params[:review][:comment])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment_id, :comment, :reviewer_id, :public, :attraction_id)
    end
end
