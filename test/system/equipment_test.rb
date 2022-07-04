require "application_system_test_case"

class EquipmentTest < ApplicationSystemTestCase
  setup do
    @equipment = equipment(:one)
  end

  test "visiting the index" do
    visit equipment_url
    assert_selector "h1", text: "Equipment"
  end

  test "should create equipment" do
    visit equipment_url
    click_on "New equipment"

    fill_in "Equipment area", with: @equipment.equipment_area_id
    fill_in "Equipment tag", with: @equipment.equipment_tag
    fill_in "Equipment type", with: @equipment.equipment_type_id
    fill_in "Name", with: @equipment.name
    fill_in "Organization", with: @equipment.organization_id
    fill_in "Service date", with: @equipment.service_date
    fill_in "Store", with: @equipment.store_id
    click_on "Create Equipment"

    assert_text "Equipment was successfully created"
    click_on "Back"
  end

  test "should update Equipment" do
    visit equipment_url(@equipment)
    click_on "Edit this equipment", match: :first

    fill_in "Equipment area", with: @equipment.equipment_area_id
    fill_in "Equipment tag", with: @equipment.equipment_tag
    fill_in "Equipment type", with: @equipment.equipment_type_id
    fill_in "Name", with: @equipment.name
    fill_in "Organization", with: @equipment.organization_id
    fill_in "Service date", with: @equipment.service_date
    fill_in "Store", with: @equipment.store_id
    click_on "Update Equipment"

    assert_text "Equipment was successfully updated"
    click_on "Back"
  end

  test "should destroy Equipment" do
    visit equipment_url(@equipment)
    click_on "Destroy this equipment", match: :first

    assert_text "Equipment was successfully destroyed"
  end
end
