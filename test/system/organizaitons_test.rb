require "application_system_test_case"

class OrganizaitonsTest < ApplicationSystemTestCase
  setup do
    @organizaiton = organizaitons(:one)
  end

  test "visiting the index" do
    visit organizaitons_url
    assert_selector "h1", text: "Organizaitons"
  end

  test "should create organizaiton" do
    visit organizaitons_url
    click_on "New organizaiton"

    fill_in "City", with: @organizaiton.city
    fill_in "Name", with: @organizaiton.name
    fill_in "Phone", with: @organizaiton.phone
    fill_in "State", with: @organizaiton.state
    fill_in "Street", with: @organizaiton.street
    fill_in "Zip", with: @organizaiton.zip
    click_on "Create Organizaiton"

    assert_text "Organizaiton was successfully created"
    click_on "Back"
  end

  test "should update Organizaiton" do
    visit organizaiton_url(@organizaiton)
    click_on "Edit this organizaiton", match: :first

    fill_in "City", with: @organizaiton.city
    fill_in "Name", with: @organizaiton.name
    fill_in "Phone", with: @organizaiton.phone
    fill_in "State", with: @organizaiton.state
    fill_in "Street", with: @organizaiton.street
    fill_in "Zip", with: @organizaiton.zip
    click_on "Update Organizaiton"

    assert_text "Organizaiton was successfully updated"
    click_on "Back"
  end

  test "should destroy Organizaiton" do
    visit organizaiton_url(@organizaiton)
    click_on "Destroy this organizaiton", match: :first

    assert_text "Organizaiton was successfully destroyed"
  end
end
