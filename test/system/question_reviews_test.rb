require "application_system_test_case"

class QuestionReviewsTest < ApplicationSystemTestCase
  setup do
    @question_review = question_reviews(:one)
  end

  test "visiting the index" do
    visit question_reviews_url
    assert_selector "h1", text: "Question Reviews"
  end

  test "creating a Question review" do
    visit question_reviews_url
    click_on "New Question Review"

    fill_in "Best flag", with: @question_review.best_flag
    fill_in "Contents", with: @question_review.contents
    fill_in "Question code", with: @question_review.question_code
    fill_in "User code", with: @question_review.user_code
    click_on "Create Question review"

    assert_text "Question review was successfully created"
    click_on "Back"
  end

  test "updating a Question review" do
    visit question_reviews_url
    click_on "Edit", match: :first

    fill_in "Best flag", with: @question_review.best_flag
    fill_in "Contents", with: @question_review.contents
    fill_in "Question code", with: @question_review.question_code
    fill_in "User code", with: @question_review.user_code
    click_on "Update Question review"

    assert_text "Question review was successfully updated"
    click_on "Back"
  end

  test "destroying a Question review" do
    visit question_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question review was successfully destroyed"
  end
end
