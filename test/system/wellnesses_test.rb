require "application_system_test_case"

class WellnessesTest < ApplicationSystemTestCase
  setup do
    @wellness = wellnesses(:one)
  end

  test "visiting the index" do
    visit wellnesses_url
    assert_selector "h1", text: "Wellnesses"
  end

  test "should create wellness" do
    visit wellnesses_url
    click_on "New wellness"

    fill_in "First name", with: @wellness.first_name
    fill_in "Last name", with: @wellness.last_name
    fill_in "Organization", with: @wellness.organization_id
    fill_in "Q1", with: @wellness.q1
    fill_in "Q2", with: @wellness.q2
    fill_in "Q3", with: @wellness.q3
    fill_in "Q4", with: @wellness.q4
    check "Reported" if @wellness.reported
    fill_in "Store", with: @wellness.store_id
    fill_in "Tc", with: @wellness.tc
    fill_in "Temp", with: @wellness.temp
    click_on "Create Wellness"

    assert_text "Wellness was successfully created"
    click_on "Back"
  end

  test "should update Wellness" do
    visit wellness_url(@wellness)
    click_on "Edit this wellness", match: :first

    fill_in "First name", with: @wellness.first_name
    fill_in "Last name", with: @wellness.last_name
    fill_in "Organization", with: @wellness.organization_id
    fill_in "Q1", with: @wellness.q1
    fill_in "Q2", with: @wellness.q2
    fill_in "Q3", with: @wellness.q3
    fill_in "Q4", with: @wellness.q4
    check "Reported" if @wellness.reported
    fill_in "Store", with: @wellness.store_id
    fill_in "Tc", with: @wellness.tc
    fill_in "Temp", with: @wellness.temp
    click_on "Update Wellness"

    assert_text "Wellness was successfully updated"
    click_on "Back"
  end

  test "should destroy Wellness" do
    visit wellness_url(@wellness)
    click_on "Destroy this wellness", match: :first

    assert_text "Wellness was successfully destroyed"
  end
end
