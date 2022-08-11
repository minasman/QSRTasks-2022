require "application_system_test_case"

class FoodSafetyAuditsTest < ApplicationSystemTestCase
  setup do
    @food_safety_audit = food_safety_audits(:one)
  end

  test "visiting the index" do
    visit food_safety_audits_url
    assert_selector "h1", text: "Food safety audits"
  end

  test "should create food safety audit" do
    visit food_safety_audits_url
    click_on "New food safety audit"

    fill_in "Fs10 us", with: @food_safety_audit.fs10_us
    fill_in "Fs11 us", with: @food_safety_audit.fs11_us
    fill_in "Fs12 us", with: @food_safety_audit.fs12_us
    fill_in "Fs13 us", with: @food_safety_audit.fs13_us
    fill_in "Fs14 us", with: @food_safety_audit.fs14_us
    fill_in "Fs15 us", with: @food_safety_audit.fs15_us
    fill_in "Fs16 us", with: @food_safety_audit.fs16_us
    fill_in "Fs17 us", with: @food_safety_audit.fs17_us
    fill_in "Fs18 us", with: @food_safety_audit.fs18_us
    fill_in "Fs19 us", with: @food_safety_audit.fs19_us
    fill_in "Fs19 us 01", with: @food_safety_audit.fs19_us_01
    fill_in "Fs1 us", with: @food_safety_audit.fs1_us
    fill_in "Fs20 us", with: @food_safety_audit.fs20_us
    fill_in "Fs21 us", with: @food_safety_audit.fs21_us
    fill_in "Fs22 us", with: @food_safety_audit.fs22_us
    fill_in "Fs23 us", with: @food_safety_audit.fs23_us
    fill_in "Fs24 us", with: @food_safety_audit.fs24_us
    fill_in "Fs25 us", with: @food_safety_audit.fs25_us
    fill_in "Fs26 us", with: @food_safety_audit.fs26_us
    fill_in "Fs26 us 01", with: @food_safety_audit.fs26_us_01
    fill_in "Fs27 us", with: @food_safety_audit.fs27_us
    fill_in "Fs28 us", with: @food_safety_audit.fs28_us
    fill_in "Fs29 us", with: @food_safety_audit.fs29_us
    fill_in "Fs2 us", with: @food_safety_audit.fs2_us
    fill_in "Fs30 us", with: @food_safety_audit.fs30_us
    fill_in "Fs31 us", with: @food_safety_audit.fs31_us
    fill_in "Fs32 us", with: @food_safety_audit.fs32_us
    fill_in "Fs33 us", with: @food_safety_audit.fs33_us
    fill_in "Fs3 us", with: @food_safety_audit.fs3_us
    fill_in "Fs4 us", with: @food_safety_audit.fs4_us
    fill_in "Fs5 us", with: @food_safety_audit.fs5_us
    fill_in "Fs6 us", with: @food_safety_audit.fs6_us
    fill_in "Fs7 us", with: @food_safety_audit.fs7_us
    fill_in "Fs8 us", with: @food_safety_audit.fs8_us
    fill_in "Fs9 us", with: @food_safety_audit.fs9_us
    fill_in "Organization", with: @food_safety_audit.organization_id
    fill_in "Score", with: @food_safety_audit.score
    fill_in "Shop date", with: @food_safety_audit.shop_date
    fill_in "Shop time", with: @food_safety_audit.shop_time
    fill_in "Store", with: @food_safety_audit.store_id
    click_on "Create Food safety audit"

    assert_text "Food safety audit was successfully created"
    click_on "Back"
  end

  test "should update Food safety audit" do
    visit food_safety_audit_url(@food_safety_audit)
    click_on "Edit this food safety audit", match: :first

    fill_in "Fs10 us", with: @food_safety_audit.fs10_us
    fill_in "Fs11 us", with: @food_safety_audit.fs11_us
    fill_in "Fs12 us", with: @food_safety_audit.fs12_us
    fill_in "Fs13 us", with: @food_safety_audit.fs13_us
    fill_in "Fs14 us", with: @food_safety_audit.fs14_us
    fill_in "Fs15 us", with: @food_safety_audit.fs15_us
    fill_in "Fs16 us", with: @food_safety_audit.fs16_us
    fill_in "Fs17 us", with: @food_safety_audit.fs17_us
    fill_in "Fs18 us", with: @food_safety_audit.fs18_us
    fill_in "Fs19 us", with: @food_safety_audit.fs19_us
    fill_in "Fs19 us 01", with: @food_safety_audit.fs19_us_01
    fill_in "Fs1 us", with: @food_safety_audit.fs1_us
    fill_in "Fs20 us", with: @food_safety_audit.fs20_us
    fill_in "Fs21 us", with: @food_safety_audit.fs21_us
    fill_in "Fs22 us", with: @food_safety_audit.fs22_us
    fill_in "Fs23 us", with: @food_safety_audit.fs23_us
    fill_in "Fs24 us", with: @food_safety_audit.fs24_us
    fill_in "Fs25 us", with: @food_safety_audit.fs25_us
    fill_in "Fs26 us", with: @food_safety_audit.fs26_us
    fill_in "Fs26 us 01", with: @food_safety_audit.fs26_us_01
    fill_in "Fs27 us", with: @food_safety_audit.fs27_us
    fill_in "Fs28 us", with: @food_safety_audit.fs28_us
    fill_in "Fs29 us", with: @food_safety_audit.fs29_us
    fill_in "Fs2 us", with: @food_safety_audit.fs2_us
    fill_in "Fs30 us", with: @food_safety_audit.fs30_us
    fill_in "Fs31 us", with: @food_safety_audit.fs31_us
    fill_in "Fs32 us", with: @food_safety_audit.fs32_us
    fill_in "Fs33 us", with: @food_safety_audit.fs33_us
    fill_in "Fs3 us", with: @food_safety_audit.fs3_us
    fill_in "Fs4 us", with: @food_safety_audit.fs4_us
    fill_in "Fs5 us", with: @food_safety_audit.fs5_us
    fill_in "Fs6 us", with: @food_safety_audit.fs6_us
    fill_in "Fs7 us", with: @food_safety_audit.fs7_us
    fill_in "Fs8 us", with: @food_safety_audit.fs8_us
    fill_in "Fs9 us", with: @food_safety_audit.fs9_us
    fill_in "Organization", with: @food_safety_audit.organization_id
    fill_in "Score", with: @food_safety_audit.score
    fill_in "Shop date", with: @food_safety_audit.shop_date
    fill_in "Shop time", with: @food_safety_audit.shop_time
    fill_in "Store", with: @food_safety_audit.store_id
    click_on "Update Food safety audit"

    assert_text "Food safety audit was successfully updated"
    click_on "Back"
  end

  test "should destroy Food safety audit" do
    visit food_safety_audit_url(@food_safety_audit)
    click_on "Destroy this food safety audit", match: :first

    assert_text "Food safety audit was successfully destroyed"
  end
end
