require "application_system_test_case"

class EquipmentTypesTest < ApplicationSystemTestCase
  setup do
    @equipment_type = equipment_types(:one)
  end

  test "visiting the index" do
    visit equipment_types_url
    assert_selector "h1", text: "Equipment types"
  end

  test "should create equipment type" do
    visit equipment_types_url
    click_on "New equipment type"

    fill_in "Equipment area", with: @equipment_type.equipment_area_id
    fill_in "Name", with: @equipment_type.name
    fill_in "Organization", with: @equipment_type.organization_id
    click_on "Create Equipment type"

    assert_text "Equipment type was successfully created"
    click_on "Back"
  end

  test "should update Equipment type" do
    visit equipment_type_url(@equipment_type)
    click_on "Edit this equipment type", match: :first

    fill_in "Equipment area", with: @equipment_type.equipment_area_id
    fill_in "Name", with: @equipment_type.name
    fill_in "Organization", with: @equipment_type.organization_id
    click_on "Update Equipment type"

    assert_text "Equipment type was successfully updated"
    click_on "Back"
  end

  test "should destroy Equipment type" do
    visit equipment_type_url(@equipment_type)
    click_on "Destroy this equipment type", match: :first

    assert_text "Equipment type was successfully destroyed"
  end
end
