require "application_system_test_case"

class EquipmentAreasTest < ApplicationSystemTestCase
  setup do
    @equipment_area = equipment_areas(:one)
  end

  test "visiting the index" do
    visit equipment_areas_url
    assert_selector "h1", text: "Equipment areas"
  end

  test "should create equipment area" do
    visit equipment_areas_url
    click_on "New equipment area"

    fill_in "Name", with: @equipment_area.name
    fill_in "Organization", with: @equipment_area.organization_id
    click_on "Create Equipment area"

    assert_text "Equipment area was successfully created"
    click_on "Back"
  end

  test "should update Equipment area" do
    visit equipment_area_url(@equipment_area)
    click_on "Edit this equipment area", match: :first

    fill_in "Name", with: @equipment_area.name
    fill_in "Organization", with: @equipment_area.organization_id
    click_on "Update Equipment area"

    assert_text "Equipment area was successfully updated"
    click_on "Back"
  end

  test "should destroy Equipment area" do
    visit equipment_area_url(@equipment_area)
    click_on "Destroy this equipment area", match: :first

    assert_text "Equipment area was successfully destroyed"
  end
end
