require 'test_helper'

class AttractionHasReviewsControllerTest < ActionController::TestCase
  setup do
    @attraction_has_review = attraction_has_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attraction_has_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attraction_has_review" do
    assert_difference('AttractionHasReview.count') do
      post :create, attraction_has_review: { attraction_id: @attraction_has_review.attraction_id, review_id: @attraction_has_review.review_id }
    end

    assert_redirected_to attraction_has_review_path(assigns(:attraction_has_review))
  end

  test "should show attraction_has_review" do
    get :show, id: @attraction_has_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attraction_has_review
    assert_response :success
  end

  test "should update attraction_has_review" do
    patch :update, id: @attraction_has_review, attraction_has_review: { attraction_id: @attraction_has_review.attraction_id, review_id: @attraction_has_review.review_id }
    assert_redirected_to attraction_has_review_path(assigns(:attraction_has_review))
  end

  test "should destroy attraction_has_review" do
    assert_difference('AttractionHasReview.count', -1) do
      delete :destroy, id: @attraction_has_review
    end

    assert_redirected_to attraction_has_reviews_path
  end
end
