require "application_system_test_case"

class QuestionCategoriesTest < ApplicationSystemTestCase
  setup do
    @question_category = question_categories(:one)
  end

  test "visiting the index" do
    visit question_categories_url
    assert_selector "h1", text: "Question Categories"
  end

  test "creating a Question category" do
    visit question_categories_url
    click_on "New Question Category"

    fill_in "Category", with: @question_category.category_id
    fill_in "Category name", with: @question_category.category_name
    click_on "Create Question category"

    assert_text "Question category was successfully created"
    click_on "Back"
  end

  test "updating a Question category" do
    visit question_categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: @question_category.category_id
    fill_in "Category name", with: @question_category.category_name
    click_on "Update Question category"

    assert_text "Question category was successfully updated"
    click_on "Back"
  end

  test "destroying a Question category" do
    visit question_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question category was successfully destroyed"
  end
end
