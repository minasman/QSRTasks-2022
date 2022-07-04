require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = comments(:one)
  end

  test "visiting the index" do
    visit comments_url
    assert_selector "h1", text: "Comments"
  end

  test "should create comment" do
    visit comments_url
    click_on "New comment"

    fill_in "Case number", with: @comment.case_number
    fill_in "Comment type", with: @comment.comment_type
    fill_in "Contact type", with: @comment.contact_type
    fill_in "Employee named", with: @comment.employee_named
    fill_in "First issue", with: @comment.first_issue
    fill_in "First issue comment", with: @comment.first_issue_comment
    fill_in "Guest", with: @comment.guest_id
    fill_in "Organization", with: @comment.organization_id
    fill_in "Second issue", with: @comment.second_issue
    fill_in "Second issue comment", with: @comment.second_issue_comment
    fill_in "Source", with: @comment.source
    fill_in "Status", with: @comment.status
    fill_in "Store", with: @comment.store_id
    fill_in "Third issue", with: @comment.third_issue
    fill_in "Third issue comment", with: @comment.third_issue_comment
    fill_in "Urgent", with: @comment.urgent
    fill_in "User", with: @comment.user_id
    fill_in "Visit date", with: @comment.visit_date
    fill_in "Visit time", with: @comment.visit_time
    fill_in "Visit type", with: @comment.visit_type
    click_on "Create Comment"

    assert_text "Comment was successfully created"
    click_on "Back"
  end

  test "should update Comment" do
    visit comment_url(@comment)
    click_on "Edit this comment", match: :first

    fill_in "Case number", with: @comment.case_number
    fill_in "Comment type", with: @comment.comment_type
    fill_in "Contact type", with: @comment.contact_type
    fill_in "Employee named", with: @comment.employee_named
    fill_in "First issue", with: @comment.first_issue
    fill_in "First issue comment", with: @comment.first_issue_comment
    fill_in "Guest", with: @comment.guest_id
    fill_in "Organization", with: @comment.organization_id
    fill_in "Second issue", with: @comment.second_issue
    fill_in "Second issue comment", with: @comment.second_issue_comment
    fill_in "Source", with: @comment.source
    fill_in "Status", with: @comment.status
    fill_in "Store", with: @comment.store_id
    fill_in "Third issue", with: @comment.third_issue
    fill_in "Third issue comment", with: @comment.third_issue_comment
    fill_in "Urgent", with: @comment.urgent
    fill_in "User", with: @comment.user_id
    fill_in "Visit date", with: @comment.visit_date
    fill_in "Visit time", with: @comment.visit_time
    fill_in "Visit type", with: @comment.visit_type
    click_on "Update Comment"

    assert_text "Comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Comment" do
    visit comment_url(@comment)
    click_on "Destroy this comment", match: :first

    assert_text "Comment was successfully destroyed"
  end
end
