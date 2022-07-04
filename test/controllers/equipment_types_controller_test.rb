require "test_helper"

class EquipmentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipment_type = equipment_types(:one)
  end

  test "should get index" do
    get equipment_types_url
    assert_response :success
  end

  test "should get new" do
    get new_equipment_type_url
    assert_response :success
  end

  test "should create equipment_type" do
    assert_difference("EquipmentType.count") do
      post equipment_types_url, params: { equipment_type: { equipment_area_id: @equipment_type.equipment_area_id, name: @equipment_type.name, organization_id: @equipment_type.organization_id } }
    end

    assert_redirected_to equipment_type_url(EquipmentType.last)
  end

  test "should show equipment_type" do
    get equipment_type_url(@equipment_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipment_type_url(@equipment_type)
    assert_response :success
  end

  test "should update equipment_type" do
    patch equipment_type_url(@equipment_type), params: { equipment_type: { equipment_area_id: @equipment_type.equipment_area_id, name: @equipment_type.name, organization_id: @equipment_type.organization_id } }
    assert_redirected_to equipment_type_url(@equipment_type)
  end

  test "should destroy equipment_type" do
    assert_difference("EquipmentType.count", -1) do
      delete equipment_type_url(@equipment_type)
    end

    assert_redirected_to equipment_types_url
  end
end
