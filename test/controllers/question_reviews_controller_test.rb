require "test_helper"

class QuestionReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_review = question_reviews(:one)
  end

  test "should get index" do
    get question_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_question_review_url
    assert_response :success
  end

  test "should create question_review" do
    assert_difference('QuestionReview.count') do
      post question_reviews_url, params: { question_review: { best_flag: @question_review.best_flag, contents: @question_review.contents, question_code: @question_review.question_code, user_code: @question_review.user_code } }
    end

    assert_redirected_to question_review_url(QuestionReview.last)
  end

  test "should show question_review" do
    get question_review_url(@question_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_review_url(@question_review)
    assert_response :success
  end

  test "should update question_review" do
    patch question_review_url(@question_review), params: { question_review: { best_flag: @question_review.best_flag, contents: @question_review.contents, question_code: @question_review.question_code, user_code: @question_review.user_code } }
    assert_redirected_to question_review_url(@question_review)
  end

  test "should destroy question_review" do
    assert_difference('QuestionReview.count', -1) do
      delete question_review_url(@question_review)
    end

    assert_redirected_to question_reviews_url
  end
end
