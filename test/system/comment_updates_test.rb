require "application_system_test_case"

class CommentUpdatesTest < ApplicationSystemTestCase
  setup do
    @comment_update = comment_updates(:one)
  end

  test "visiting the index" do
    visit comment_updates_url
    assert_selector "h1", text: "Comment updates"
  end

  test "should create comment update" do
    visit comment_updates_url
    click_on "New comment update"

    fill_in "Comment", with: @comment_update.comment_id
    fill_in "Current update", with: @comment_update.current_update
    fill_in "Employee name", with: @comment_update.employee_name
    fill_in "Update date", with: @comment_update.update_date
    fill_in "Update time", with: @comment_update.update_time
    fill_in "Update type", with: @comment_update.update_type
    fill_in "User", with: @comment_update.user_id
    click_on "Create Comment update"

    assert_text "Comment update was successfully created"
    click_on "Back"
  end

  test "should update Comment update" do
    visit comment_update_url(@comment_update)
    click_on "Edit this comment update", match: :first

    fill_in "Comment", with: @comment_update.comment_id
    fill_in "Current update", with: @comment_update.current_update
    fill_in "Employee name", with: @comment_update.employee_name
    fill_in "Update date", with: @comment_update.update_date
    fill_in "Update time", with: @comment_update.update_time
    fill_in "Update type", with: @comment_update.update_type
    fill_in "User", with: @comment_update.user_id
    click_on "Update Comment update"

    assert_text "Comment update was successfully updated"
    click_on "Back"
  end

  test "should destroy Comment update" do
    visit comment_update_url(@comment_update)
    click_on "Destroy this comment update", match: :first

    assert_text "Comment update was successfully destroyed"
  end
end
