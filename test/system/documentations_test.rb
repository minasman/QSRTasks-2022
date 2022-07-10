require "application_system_test_case"

class DocumentationsTest < ApplicationSystemTestCase
  setup do
    @documentation = documentations(:one)
  end

  test "visiting the index" do
    visit documentations_url
    assert_selector "h1", text: "Documentations"
  end

  test "should create documentation" do
    visit documentations_url
    click_on "New documentation"

    fill_in "Awarded by", with: @documentation.awarded_by_id
    fill_in "Description", with: @documentation.description
    fill_in "Document date", with: @documentation.document_date
    fill_in "Document description", with: @documentation.document_description
    fill_in "Document", with: @documentation.document_id
    fill_in "Documentation class", with: @documentation.documentation_class
    fill_in "Documentation type", with: @documentation.documentation_type
    fill_in "Employee named", with: @documentation.employee_named_id
    fill_in "individual", with: @documentation.individual
    fill_in "Level", with: @documentation.level
    fill_in "Organization", with: @documentation.organization_id
    fill_in "Points", with: @documentation.points
    fill_in "Position", with: @documentation.position_id
    fill_in "Store", with: @documentation.store_id
    click_on "Create Documentation"

    assert_text "Documentation was successfully created"
    click_on "Back"
  end

  test "should update Documentation" do
    visit documentation_url(@documentation)
    click_on "Edit this documentation", match: :first

    fill_in "Awarded by", with: @documentation.awarded_by_id
    fill_in "Description", with: @documentation.description
    fill_in "Document date", with: @documentation.document_date
    fill_in "Document description", with: @documentation.document_description
    fill_in "Document", with: @documentation.document_id
    fill_in "Documentation class", with: @documentation.documentation_class
    fill_in "Documentation type", with: @documentation.documentation_type
    fill_in "Employee named", with: @documentation.employee_named_id
    fill_in "individual", with: @documentation.individual
    fill_in "Level", with: @documentation.level
    fill_in "Organization", with: @documentation.organization_id
    fill_in "Points", with: @documentation.points
    fill_in "Position", with: @documentation.position_id
    fill_in "Store", with: @documentation.store_id
    click_on "Update Documentation"

    assert_text "Documentation was successfully updated"
    click_on "Back"
  end

  test "should destroy Documentation" do
    visit documentation_url(@documentation)
    click_on "Destroy this documentation", match: :first

    assert_text "Documentation was successfully destroyed"
  end
end
