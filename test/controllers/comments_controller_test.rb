require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post comments_url, params: { comment: { case_number: @comment.case_number, comment_type: @comment.comment_type, contact_type: @comment.contact_type, employee_named: @comment.employee_named, first_issue: @comment.first_issue, first_issue_comment: @comment.first_issue_comment, guest_id: @comment.guest_id, organization_id: @comment.organization_id, second_issue: @comment.second_issue, second_issue_comment: @comment.second_issue_comment, source: @comment.source, status: @comment.status, store_id: @comment.store_id, third_issue: @comment.third_issue, third_issue_comment: @comment.third_issue_comment, urgent: @comment.urgent, user_id: @comment.user_id, visit_date: @comment.visit_date, visit_time: @comment.visit_time, visit_type: @comment.visit_type } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { case_number: @comment.case_number, comment_type: @comment.comment_type, contact_type: @comment.contact_type, employee_named: @comment.employee_named, first_issue: @comment.first_issue, first_issue_comment: @comment.first_issue_comment, guest_id: @comment.guest_id, organization_id: @comment.organization_id, second_issue: @comment.second_issue, second_issue_comment: @comment.second_issue_comment, source: @comment.source, status: @comment.status, store_id: @comment.store_id, third_issue: @comment.third_issue, third_issue_comment: @comment.third_issue_comment, urgent: @comment.urgent, user_id: @comment.user_id, visit_date: @comment.visit_date, visit_time: @comment.visit_time, visit_type: @comment.visit_type } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
