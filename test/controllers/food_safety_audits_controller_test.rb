require "test_helper"

class FoodSafetyAuditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_safety_audit = food_safety_audits(:one)
  end

  test "should get index" do
    get food_safety_audits_url
    assert_response :success
  end

  test "should get new" do
    get new_food_safety_audit_url
    assert_response :success
  end

  test "should create food_safety_audit" do
    assert_difference("FoodSafetyAudit.count") do
      post food_safety_audits_url, params: { food_safety_audit: { fs10_us: @food_safety_audit.fs10_us, fs11_us: @food_safety_audit.fs11_us, fs12_us: @food_safety_audit.fs12_us, fs13_us: @food_safety_audit.fs13_us, fs14_us: @food_safety_audit.fs14_us, fs15_us: @food_safety_audit.fs15_us, fs16_us: @food_safety_audit.fs16_us, fs17_us: @food_safety_audit.fs17_us, fs18_us: @food_safety_audit.fs18_us, fs19_us: @food_safety_audit.fs19_us, fs19_us_01: @food_safety_audit.fs19_us_01, fs1_us: @food_safety_audit.fs1_us, fs20_us: @food_safety_audit.fs20_us, fs21_us: @food_safety_audit.fs21_us, fs22_us: @food_safety_audit.fs22_us, fs23_us: @food_safety_audit.fs23_us, fs24_us: @food_safety_audit.fs24_us, fs25_us: @food_safety_audit.fs25_us, fs26_us: @food_safety_audit.fs26_us, fs26_us_01: @food_safety_audit.fs26_us_01, fs27_us: @food_safety_audit.fs27_us, fs28_us: @food_safety_audit.fs28_us, fs29_us: @food_safety_audit.fs29_us, fs2_us: @food_safety_audit.fs2_us, fs30_us: @food_safety_audit.fs30_us, fs31_us: @food_safety_audit.fs31_us, fs32_us: @food_safety_audit.fs32_us, fs33_us: @food_safety_audit.fs33_us, fs3_us: @food_safety_audit.fs3_us, fs4_us: @food_safety_audit.fs4_us, fs5_us: @food_safety_audit.fs5_us, fs6_us: @food_safety_audit.fs6_us, fs7_us: @food_safety_audit.fs7_us, fs8_us: @food_safety_audit.fs8_us, fs9_us: @food_safety_audit.fs9_us, organization_id: @food_safety_audit.organization_id, score: @food_safety_audit.score, shop_date: @food_safety_audit.shop_date, shop_time: @food_safety_audit.shop_time, store_id: @food_safety_audit.store_id } }
    end

    assert_redirected_to food_safety_audit_url(FoodSafetyAudit.last)
  end

  test "should show food_safety_audit" do
    get food_safety_audit_url(@food_safety_audit)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_safety_audit_url(@food_safety_audit)
    assert_response :success
  end

  test "should update food_safety_audit" do
    patch food_safety_audit_url(@food_safety_audit), params: { food_safety_audit: { fs10_us: @food_safety_audit.fs10_us, fs11_us: @food_safety_audit.fs11_us, fs12_us: @food_safety_audit.fs12_us, fs13_us: @food_safety_audit.fs13_us, fs14_us: @food_safety_audit.fs14_us, fs15_us: @food_safety_audit.fs15_us, fs16_us: @food_safety_audit.fs16_us, fs17_us: @food_safety_audit.fs17_us, fs18_us: @food_safety_audit.fs18_us, fs19_us: @food_safety_audit.fs19_us, fs19_us_01: @food_safety_audit.fs19_us_01, fs1_us: @food_safety_audit.fs1_us, fs20_us: @food_safety_audit.fs20_us, fs21_us: @food_safety_audit.fs21_us, fs22_us: @food_safety_audit.fs22_us, fs23_us: @food_safety_audit.fs23_us, fs24_us: @food_safety_audit.fs24_us, fs25_us: @food_safety_audit.fs25_us, fs26_us: @food_safety_audit.fs26_us, fs26_us_01: @food_safety_audit.fs26_us_01, fs27_us: @food_safety_audit.fs27_us, fs28_us: @food_safety_audit.fs28_us, fs29_us: @food_safety_audit.fs29_us, fs2_us: @food_safety_audit.fs2_us, fs30_us: @food_safety_audit.fs30_us, fs31_us: @food_safety_audit.fs31_us, fs32_us: @food_safety_audit.fs32_us, fs33_us: @food_safety_audit.fs33_us, fs3_us: @food_safety_audit.fs3_us, fs4_us: @food_safety_audit.fs4_us, fs5_us: @food_safety_audit.fs5_us, fs6_us: @food_safety_audit.fs6_us, fs7_us: @food_safety_audit.fs7_us, fs8_us: @food_safety_audit.fs8_us, fs9_us: @food_safety_audit.fs9_us, organization_id: @food_safety_audit.organization_id, score: @food_safety_audit.score, shop_date: @food_safety_audit.shop_date, shop_time: @food_safety_audit.shop_time, store_id: @food_safety_audit.store_id } }
    assert_redirected_to food_safety_audit_url(@food_safety_audit)
  end

  test "should destroy food_safety_audit" do
    assert_difference("FoodSafetyAudit.count", -1) do
      delete food_safety_audit_url(@food_safety_audit)
    end

    assert_redirected_to food_safety_audits_url
  end
end
