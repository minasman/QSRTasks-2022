require "application_system_test_case"

class WorkordersTest < ApplicationSystemTestCase
  setup do
    @workorder = workorders(:one)
  end

  test "visiting the index" do
    visit workorders_url
    assert_selector "h1", text: "Workorders"
  end

  test "should create workorder" do
    visit workorders_url
    click_on "New workorder"

    fill_in "Assigned", with: @workorder.assigned
    fill_in "Equipment area", with: @workorder.equipment_area_id
    fill_in "Equipment", with: @workorder.equipment_id
    fill_in "Equipment type", with: @workorder.equipment_type_id
    fill_in "Level", with: @workorder.level
    fill_in "Organization", with: @workorder.organization_id
    fill_in "Status", with: @workorder.status
    fill_in "Store", with: @workorder.store_id
    fill_in "Team", with: @workorder.team
    fill_in "User", with: @workorder.user_id
    fill_in "Vendor", with: @workorder.vendor_id
    fill_in "Workorder issue", with: @workorder.workorder_issue
    click_on "Create Workorder"

    assert_text "Workorder was successfully created"
    click_on "Back"
  end

  test "should update Workorder" do
    visit workorder_url(@workorder)
    click_on "Edit this workorder", match: :first

    fill_in "Assigned", with: @workorder.assigned
    fill_in "Equipment area", with: @workorder.equipment_area_id
    fill_in "Equipment", with: @workorder.equipment_id
    fill_in "Equipment type", with: @workorder.equipment_type_id
    fill_in "Level", with: @workorder.level
    fill_in "Organization", with: @workorder.organization_id
    fill_in "Status", with: @workorder.status
    fill_in "Store", with: @workorder.store_id
    fill_in "Team", with: @workorder.team
    fill_in "User", with: @workorder.user_id
    fill_in "Vendor", with: @workorder.vendor_id
    fill_in "Workorder issue", with: @workorder.workorder_issue
    click_on "Update Workorder"

    assert_text "Workorder was successfully updated"
    click_on "Back"
  end

  test "should destroy Workorder" do
    visit workorder_url(@workorder)
    click_on "Destroy this workorder", match: :first

    assert_text "Workorder was successfully destroyed"
  end
end
