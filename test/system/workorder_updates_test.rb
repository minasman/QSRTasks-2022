require "application_system_test_case"

class WorkorderUpdatesTest < ApplicationSystemTestCase
  setup do
    @workorder_update = workorder_updates(:one)
  end

  test "visiting the index" do
    visit workorder_updates_url
    assert_selector "h1", text: "Workorder updates"
  end

  test "should create workorder update" do
    visit workorder_updates_url
    click_on "New workorder update"

    fill_in "Current update", with: @workorder_update.current_update
    fill_in "Manager", with: @workorder_update.manager
    fill_in "Signature", with: @workorder_update.signature
    fill_in "User", with: @workorder_update.user_id
    fill_in "Workorder", with: @workorder_update.workorder_id
    click_on "Create Workorder update"

    assert_text "Workorder update was successfully created"
    click_on "Back"
  end

  test "should update Workorder update" do
    visit workorder_update_url(@workorder_update)
    click_on "Edit this workorder update", match: :first

    fill_in "Current update", with: @workorder_update.current_update
    fill_in "Manager", with: @workorder_update.manager
    fill_in "Signature", with: @workorder_update.signature
    fill_in "User", with: @workorder_update.user_id
    fill_in "Workorder", with: @workorder_update.workorder_id
    click_on "Update Workorder update"

    assert_text "Workorder update was successfully updated"
    click_on "Back"
  end

  test "should destroy Workorder update" do
    visit workorder_update_url(@workorder_update)
    click_on "Destroy this workorder update", match: :first

    assert_text "Workorder update was successfully destroyed"
  end
end
