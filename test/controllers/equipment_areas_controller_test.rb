require "test_helper"

class EquipmentAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_area = equipment_areas(:one)
  end

  test "should get index" do
    get equipment_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_area_url
    assert_response :success
  end

  test "should create equipment_area" do
    assert_difference("EquipmentArea.count") do
      post equipment_areas_url, params: { equipment_area: { name: @equipment_area.name, organization_id: @equipment_area.organization_id } }
    end

    assert_redirected_to equipment_area_url(EquipmentArea.last)
  end

  test "should show equipment_area" do
    get equipment_area_url(@equipment_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_area_url(@equipment_area)
    assert_response :success
  end

  test "should update equipment_area" do
    patch equipment_area_url(@equipment_area), params: { equipment_area: { name: @equipment_area.name, organization_id: @equipment_area.organization_id } }
    assert_redirected_to equipment_area_url(@equipment_area)
  end

  test "should destroy equipment_area" do
    assert_difference("EquipmentArea.count", -1) do
      delete equipment_area_url(@equipment_area)
    end

    assert_redirected_to equipment_areas_url
  end
end
