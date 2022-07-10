require "test_helper"

class DocumentationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documentation = documentations(:one)
  end

  test "should get index" do
    get documentations_url
    assert_response :success
  end

  test "should get new" do
    get new_documentation_url
    assert_response :success
  end

  test "should create documentation" do
    assert_difference("Documentation.count") do
      post documentations_url, params: { documentation: { awarded_by_id: @documentation.awarded_by_id, description: @documentation.description, document_date: @documentation.document_date, document_description: @documentation.document_description, document_id: @documentation.document_id, documentation_class: @documentation.documentation_class, documentation_type: @documentation.documentation_type, employee_named_id: @documentation.employee_named_id, individual: @documentation.individual, level: @documentation.level, organization_id: @documentation.organization_id, points: @documentation.points, position_id: @documentation.position_id, store_id: @documentation.store_id } }
    end

    assert_redirected_to documentation_url(Documentation.last)
  end

  test "should show documentation" do
    get documentation_url(@documentation)
    assert_response :success
  end

  test "should get edit" do
    get edit_documentation_url(@documentation)
    assert_response :success
  end

  test "should update documentation" do
    patch documentation_url(@documentation), params: { documentation: { awarded_by_id: @documentation.awarded_by_id, description: @documentation.description, document_date: @documentation.document_date, document_description: @documentation.document_description, document_id: @documentation.document_id, documentation_class: @documentation.documentation_class, documentation_type: @documentation.documentation_type, employee_named_id: @documentation.employee_named_id, individual: @documentation.individual, level: @documentation.level, organization_id: @documentation.organization_id, points: @documentation.points, position_id: @documentation.position_id, store_id: @documentation.store_id } }
    assert_redirected_to documentation_url(@documentation)
  end

  test "should destroy documentation" do
    assert_difference("Documentation.count", -1) do
      delete documentation_url(@documentation)
    end

    assert_redirected_to documentations_url
  end
end
