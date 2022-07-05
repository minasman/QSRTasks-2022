require "test_helper"

class SafeAuditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @safe_audit = safe_audits(:one)
  end

  test "should get index" do
    get safe_audits_url
    assert_response :success
  end

  test "should get new" do
    get new_safe_audit_url
    assert_response :success
  end

  test "should create safe_audit" do
    assert_difference("SafeAudit.count") do
      post safe_audits_url, params: { safe_audit: { coin_changer: @safe_audit.coin_changer, comment: @safe_audit.comment, dime: @safe_audit.dime, dollar_coin: @safe_audit.dollar_coin, drawer: @safe_audit.drawer, drawer_amount: @safe_audit.drawer_amount, fifty: @safe_audit.fifty, five: @safe_audit.five, gift_certificate: @safe_audit.gift_certificate, gift_certificate_redeemed: @safe_audit.gift_certificate_redeemed, half_dollar: @safe_audit.half_dollar, hundred: @safe_audit.hundred, ipad: @safe_audit.ipad, manager: @safe_audit.manager, misc_coin: @safe_audit.misc_coin, misc_other: @safe_audit.misc_other, missing_headset: @safe_audit.missing_headset, nickel: @safe_audit.nickel, non_working_headset: @safe_audit.non_working_headset, one: @safe_audit.one, organization_id: @safe_audit.organization_id, other: @safe_audit.other, penny: @safe_audit.penny, quarter: @safe_audit.quarter, receipt: @safe_audit.receipt, safe_audit_date: @safe_audit.safe_audit_date, safe_audit_time: @safe_audit.safe_audit_time, safe_variance: @safe_audit.safe_variance, shift_manager: @safe_audit.shift_manager, signature: @safe_audit.signature, store_id: @safe_audit.store_id, ten: @safe_audit.ten, total_headset: @safe_audit.total_headset, total_safe: @safe_audit.total_safe, twenty: @safe_audit.twenty, two: @safe_audit.two, user_id: @safe_audit.user_id, working_headset: @safe_audit.working_headset } }
    end

    assert_redirected_to safe_audit_url(SafeAudit.last)
  end

  test "should show safe_audit" do
    get safe_audit_url(@safe_audit)
    assert_response :success
  end

  test "should get edit" do
    get edit_safe_audit_url(@safe_audit)
    assert_response :success
  end

  test "should update safe_audit" do
    patch safe_audit_url(@safe_audit), params: { safe_audit: { coin_changer: @safe_audit.coin_changer, comment: @safe_audit.comment, dime: @safe_audit.dime, dollar_coin: @safe_audit.dollar_coin, drawer: @safe_audit.drawer, drawer_amount: @safe_audit.drawer_amount, fifty: @safe_audit.fifty, five: @safe_audit.five, gift_certificate: @safe_audit.gift_certificate, gift_certificate_redeemed: @safe_audit.gift_certificate_redeemed, half_dollar: @safe_audit.half_dollar, hundred: @safe_audit.hundred, ipad: @safe_audit.ipad, manager: @safe_audit.manager, misc_coin: @safe_audit.misc_coin, misc_other: @safe_audit.misc_other, missing_headset: @safe_audit.missing_headset, nickel: @safe_audit.nickel, non_working_headset: @safe_audit.non_working_headset, one: @safe_audit.one, organization_id: @safe_audit.organization_id, other: @safe_audit.other, penny: @safe_audit.penny, quarter: @safe_audit.quarter, receipt: @safe_audit.receipt, safe_audit_date: @safe_audit.safe_audit_date, safe_audit_time: @safe_audit.safe_audit_time, safe_variance: @safe_audit.safe_variance, shift_manager: @safe_audit.shift_manager, signature: @safe_audit.signature, store_id: @safe_audit.store_id, ten: @safe_audit.ten, total_headset: @safe_audit.total_headset, total_safe: @safe_audit.total_safe, twenty: @safe_audit.twenty, two: @safe_audit.two, user_id: @safe_audit.user_id, working_headset: @safe_audit.working_headset } }
    assert_redirected_to safe_audit_url(@safe_audit)
  end

  test "should destroy safe_audit" do
    assert_difference("SafeAudit.count", -1) do
      delete safe_audit_url(@safe_audit)
    end

    assert_redirected_to safe_audits_url
  end
end
