require "application_system_test_case"

class TclassesTest < ApplicationSystemTestCase
  setup do
    @tclass = tclasses(:one)
  end

  test "visiting the index" do
    visit tclasses_url
    assert_selector "h1", text: "Tclasses"
  end

  test "should create tclass" do
    visit tclasses_url
    click_on "New tclass"

    fill_in "Capacity", with: @tclass.capacity
    fill_in "Class date", with: @tclass.class_date
    fill_in "Class time", with: @tclass.class_time
    fill_in "Curriculum", with: @tclass.curriculum_id
    fill_in "Duration", with: @tclass.duration
    fill_in "Expense", with: @tclass.expense
    fill_in "Location", with: @tclass.location
    fill_in "Name", with: @tclass.name
    click_on "Create Tclass"

    assert_text "Tclass was successfully created"
    click_on "Back"
  end

  test "should update Tclass" do
    visit tclass_url(@tclass)
    click_on "Edit this tclass", match: :first

    fill_in "Capacity", with: @tclass.capacity
    fill_in "Class date", with: @tclass.class_date
    fill_in "Class time", with: @tclass.class_time
    fill_in "Curriculum", with: @tclass.curriculum_id
    fill_in "Duration", with: @tclass.duration
    fill_in "Expense", with: @tclass.expense
    fill_in "Location", with: @tclass.location
    fill_in "Name", with: @tclass.name
    click_on "Update Tclass"

    assert_text "Tclass was successfully updated"
    click_on "Back"
  end

  test "should destroy Tclass" do
    visit tclass_url(@tclass)
    click_on "Destroy this tclass", match: :first

    assert_text "Tclass was successfully destroyed"
  end
end
