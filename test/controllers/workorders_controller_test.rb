require "test_helper"

class WorkordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workorder = workorders(:one)
  end

  test "should get index" do
    get workorders_url
    assert_response :success
  end

  test "should get new" do
    get new_workorder_url
    assert_response :success
  end

  test "should create workorder" do
    assert_difference("Workorder.count") do
      post workorders_url, params: { workorder: { assigned: @workorder.assigned, equipment_area_id: @workorder.equipment_area_id, equipment_id: @workorder.equipment_id, equipment_type_id: @workorder.equipment_type_id, level: @workorder.level, organization_id: @workorder.organization_id, status: @workorder.status, store_id: @workorder.store_id, team: @workorder.team, user_id: @workorder.user_id, vendor_id: @workorder.vendor_id, workorder_issue: @workorder.workorder_issue } }
    end

    assert_redirected_to workorder_url(Workorder.last)
  end

  test "should show workorder" do
    get workorder_url(@workorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_workorder_url(@workorder)
    assert_response :success
  end

  test "should update workorder" do
    patch workorder_url(@workorder), params: { workorder: { assigned: @workorder.assigned, equipment_area_id: @workorder.equipment_area_id, equipment_id: @workorder.equipment_id, equipment_type_id: @workorder.equipment_type_id, level: @workorder.level, organization_id: @workorder.organization_id, status: @workorder.status, store_id: @workorder.store_id, team: @workorder.team, user_id: @workorder.user_id, vendor_id: @workorder.vendor_id, workorder_issue: @workorder.workorder_issue } }
    assert_redirected_to workorder_url(@workorder)
  end

  test "should destroy workorder" do
    assert_difference("Workorder.count", -1) do
      delete workorder_url(@workorder)
    end

    assert_redirected_to workorders_url
  end
end
