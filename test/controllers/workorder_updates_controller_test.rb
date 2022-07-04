require "test_helper"

class WorkorderUpdatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workorder_update = workorder_updates(:one)
  end

  test "should get index" do
    get workorder_updates_url
    assert_response :success
  end

  test "should get new" do
    get new_workorder_update_url
    assert_response :success
  end

  test "should create workorder_update" do
    assert_difference("WorkorderUpdate.count") do
      post workorder_updates_url, params: { workorder_update: { current_update: @workorder_update.current_update, manager: @workorder_update.manager, signature: @workorder_update.signature, user_id: @workorder_update.user_id, workorder_id: @workorder_update.workorder_id } }
    end

    assert_redirected_to workorder_update_url(WorkorderUpdate.last)
  end

  test "should show workorder_update" do
    get workorder_update_url(@workorder_update)
    assert_response :success
  end

  test "should get edit" do
    get edit_workorder_update_url(@workorder_update)
    assert_response :success
  end

  test "should update workorder_update" do
    patch workorder_update_url(@workorder_update), params: { workorder_update: { current_update: @workorder_update.current_update, manager: @workorder_update.manager, signature: @workorder_update.signature, user_id: @workorder_update.user_id, workorder_id: @workorder_update.workorder_id } }
    assert_redirected_to workorder_update_url(@workorder_update)
  end

  test "should destroy workorder_update" do
    assert_difference("WorkorderUpdate.count", -1) do
      delete workorder_update_url(@workorder_update)
    end

    assert_redirected_to workorder_updates_url
  end
end
