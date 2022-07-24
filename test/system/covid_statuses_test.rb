require "application_system_test_case"

class CovidStatusesTest < ApplicationSystemTestCase
  setup do
    @covid_status = covid_statuses(:one)
  end

  test "visiting the index" do
    visit covid_statuses_url
    assert_selector "h1", text: "Covid statuses"
  end

  test "should create covid status" do
    visit covid_statuses_url
    click_on "New covid status"

    fill_in "First name", with: @covid_status.first_name
    fill_in "Last name", with: @covid_status.last_name
    fill_in "Organization", with: @covid_status.organization_id
    fill_in "Status", with: @covid_status.status
    fill_in "Store", with: @covid_status.store_id
    fill_in "Timecard", with: @covid_status.timecard
    fill_in "User", with: @covid_status.user_id
    click_on "Create Covid status"

    assert_text "Covid status was successfully created"
    click_on "Back"
  end

  test "should update Covid status" do
    visit covid_status_url(@covid_status)
    click_on "Edit this covid status", match: :first

    fill_in "First name", with: @covid_status.first_name
    fill_in "Last name", with: @covid_status.last_name
    fill_in "Organization", with: @covid_status.organization_id
    fill_in "Status", with: @covid_status.status
    fill_in "Store", with: @covid_status.store_id
    fill_in "Timecard", with: @covid_status.timecard
    fill_in "User", with: @covid_status.user_id
    click_on "Update Covid status"

    assert_text "Covid status was successfully updated"
    click_on "Back"
  end

  test "should destroy Covid status" do
    visit covid_status_url(@covid_status)
    click_on "Destroy this covid status", match: :first

    assert_text "Covid status was successfully destroyed"
  end
end
