require "application_system_test_case"

class SafeAuditsTest < ApplicationSystemTestCase
  setup do
    @safe_audit = safe_audits(:one)
  end

  test "visiting the index" do
    visit safe_audits_url
    assert_selector "h1", text: "Safe audits"
  end

  test "should create safe audit" do
    visit safe_audits_url
    click_on "New safe audit"

    fill_in "Coin changer", with: @safe_audit.coin_changer
    fill_in "Comment", with: @safe_audit.comment
    fill_in "Dime", with: @safe_audit.dime
    fill_in "Dollar coin", with: @safe_audit.dollar_coin
    fill_in "Drawer", with: @safe_audit.drawer
    fill_in "Drawer amount", with: @safe_audit.drawer_amount
    fill_in "Fifty", with: @safe_audit.fifty
    fill_in "Five", with: @safe_audit.five
    fill_in "Gift certificate", with: @safe_audit.gift_certificate
    fill_in "Gift certificate redeemed", with: @safe_audit.gift_certificate_redeemed
    fill_in "Half dollar", with: @safe_audit.half_dollar
    fill_in "Hundred", with: @safe_audit.hundred
    fill_in "Ipad", with: @safe_audit.ipad
    fill_in "Manager", with: @safe_audit.manager
    fill_in "Misc coin", with: @safe_audit.misc_coin
    fill_in "Misc other", with: @safe_audit.misc_other
    fill_in "Missing headset", with: @safe_audit.missing_headset
    fill_in "Nickel", with: @safe_audit.nickel
    fill_in "Non working headset", with: @safe_audit.non_working_headset
    fill_in "One", with: @safe_audit.one
    fill_in "Organization", with: @safe_audit.organization_id
    fill_in "Other", with: @safe_audit.other
    fill_in "Penny", with: @safe_audit.penny
    fill_in "Quarter", with: @safe_audit.quarter
    fill_in "Receipt", with: @safe_audit.receipt
    fill_in "Safe audit date", with: @safe_audit.safe_audit_date
    fill_in "Safe audit time", with: @safe_audit.safe_audit_time
    fill_in "Safe variance", with: @safe_audit.safe_variance
    fill_in "Shift manager", with: @safe_audit.shift_manager
    fill_in "Signature", with: @safe_audit.signature
    fill_in "Store", with: @safe_audit.store_id
    fill_in "Ten", with: @safe_audit.ten
    fill_in "Total headset", with: @safe_audit.total_headset
    fill_in "Total safe", with: @safe_audit.total_safe
    fill_in "Twenty", with: @safe_audit.twenty
    fill_in "Two", with: @safe_audit.two
    fill_in "User", with: @safe_audit.user_id
    fill_in "Working headset", with: @safe_audit.working_headset
    click_on "Create Safe audit"

    assert_text "Safe audit was successfully created"
    click_on "Back"
  end

  test "should update Safe audit" do
    visit safe_audit_url(@safe_audit)
    click_on "Edit this safe audit", match: :first

    fill_in "Coin changer", with: @safe_audit.coin_changer
    fill_in "Comment", with: @safe_audit.comment
    fill_in "Dime", with: @safe_audit.dime
    fill_in "Dollar coin", with: @safe_audit.dollar_coin
    fill_in "Drawer", with: @safe_audit.drawer
    fill_in "Drawer amount", with: @safe_audit.drawer_amount
    fill_in "Fifty", with: @safe_audit.fifty
    fill_in "Five", with: @safe_audit.five
    fill_in "Gift certificate", with: @safe_audit.gift_certificate
    fill_in "Gift certificate redeemed", with: @safe_audit.gift_certificate_redeemed
    fill_in "Half dollar", with: @safe_audit.half_dollar
    fill_in "Hundred", with: @safe_audit.hundred
    fill_in "Ipad", with: @safe_audit.ipad
    fill_in "Manager", with: @safe_audit.manager
    fill_in "Misc coin", with: @safe_audit.misc_coin
    fill_in "Misc other", with: @safe_audit.misc_other
    fill_in "Missing headset", with: @safe_audit.missing_headset
    fill_in "Nickel", with: @safe_audit.nickel
    fill_in "Non working headset", with: @safe_audit.non_working_headset
    fill_in "One", with: @safe_audit.one
    fill_in "Organization", with: @safe_audit.organization_id
    fill_in "Other", with: @safe_audit.other
    fill_in "Penny", with: @safe_audit.penny
    fill_in "Quarter", with: @safe_audit.quarter
    fill_in "Receipt", with: @safe_audit.receipt
    fill_in "Safe audit date", with: @safe_audit.safe_audit_date
    fill_in "Safe audit time", with: @safe_audit.safe_audit_time
    fill_in "Safe variance", with: @safe_audit.safe_variance
    fill_in "Shift manager", with: @safe_audit.shift_manager
    fill_in "Signature", with: @safe_audit.signature
    fill_in "Store", with: @safe_audit.store_id
    fill_in "Ten", with: @safe_audit.ten
    fill_in "Total headset", with: @safe_audit.total_headset
    fill_in "Total safe", with: @safe_audit.total_safe
    fill_in "Twenty", with: @safe_audit.twenty
    fill_in "Two", with: @safe_audit.two
    fill_in "User", with: @safe_audit.user_id
    fill_in "Working headset", with: @safe_audit.working_headset
    click_on "Update Safe audit"

    assert_text "Safe audit was successfully updated"
    click_on "Back"
  end

  test "should destroy Safe audit" do
    visit safe_audit_url(@safe_audit)
    click_on "Destroy this safe audit", match: :first

    assert_text "Safe audit was successfully destroyed"
  end
end
