require "application_system_test_case"

class NewHiresTest < ApplicationSystemTestCase
  setup do
    @new_hire = new_hires(:one)
  end

  test "visiting the index" do
    visit new_hires_url
    assert_selector "h1", text: "New hires"
  end

  test "should create new hire" do
    visit new_hires_url
    click_on "New new hire"

    check "Attended" if @new_hire.attended
    check "Background na" if @new_hire.background_na
    check "Background ok" if @new_hire.background_ok
    check "Background received" if @new_hire.background_received
    fill_in "Birthdate", with: @new_hire.birthdate
    fill_in "Comments", with: @new_hire.comments
    fill_in "Email", with: @new_hire.email
    fill_in "First name", with: @new_hire.first_name
    fill_in "Hear", with: @new_hire.hear
    fill_in "Last name", with: @new_hire.last_name
    fill_in "Notes", with: @new_hire.notes
    fill_in "Organization", with: @new_hire.organization_id
    fill_in "Phone", with: @new_hire.phone
    fill_in "Position", with: @new_hire.position_id
    fill_in "Rate", with: @new_hire.rate
    fill_in "Referred by", with: @new_hire.referred_by
    check "Rehire" if @new_hire.rehire
    fill_in "Requirements", with: @new_hire.requirements
    fill_in "Social", with: @new_hire.social
    fill_in "Store", with: @new_hire.store_id
    fill_in "User", with: @new_hire.user_id
    click_on "Create New hire"

    assert_text "New hire was successfully created"
    click_on "Back"
  end

  test "should update New hire" do
    visit new_hire_url(@new_hire)
    click_on "Edit this new hire", match: :first

    check "Attended" if @new_hire.attended
    check "Background na" if @new_hire.background_na
    check "Background ok" if @new_hire.background_ok
    check "Background received" if @new_hire.background_received
    fill_in "Birthdate", with: @new_hire.birthdate
    fill_in "Comments", with: @new_hire.comments
    fill_in "Email", with: @new_hire.email
    fill_in "First name", with: @new_hire.first_name
    fill_in "Hear", with: @new_hire.hear
    fill_in "Last name", with: @new_hire.last_name
    fill_in "Notes", with: @new_hire.notes
    fill_in "Organization", with: @new_hire.organization_id
    fill_in "Phone", with: @new_hire.phone
    fill_in "Position", with: @new_hire.position_id
    fill_in "Rate", with: @new_hire.rate
    fill_in "Referred by", with: @new_hire.referred_by
    check "Rehire" if @new_hire.rehire
    fill_in "Requirements", with: @new_hire.requirements
    fill_in "Social", with: @new_hire.social
    fill_in "Store", with: @new_hire.store_id
    fill_in "User", with: @new_hire.user_id
    click_on "Update New hire"

    assert_text "New hire was successfully updated"
    click_on "Back"
  end

  test "should destroy New hire" do
    visit new_hire_url(@new_hire)
    click_on "Destroy this new hire", match: :first

    assert_text "New hire was successfully destroyed"
  end
end
