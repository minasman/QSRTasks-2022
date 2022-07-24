require "test_helper"

class WellnessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wellness = wellnesses(:one)
  end

  test "should get index" do
    get wellnesses_url
    assert_response :success
  end

  test "should get new" do
    get new_wellness_url
    assert_response :success
  end

  test "should create wellness" do
    assert_difference("Wellness.count") do
      post wellnesses_url, params: { wellness: { first_name: @wellness.first_name, last_name: @wellness.last_name, organization_id: @wellness.organization_id, q1: @wellness.q1, q2: @wellness.q2, q3: @wellness.q3, q4: @wellness.q4, reported: @wellness.reported, store_id: @wellness.store_id, tc: @wellness.tc, temp: @wellness.temp } }
    end

    assert_redirected_to wellness_url(Wellness.last)
  end

  test "should show wellness" do
    get wellness_url(@wellness)
    assert_response :success
  end

  test "should get edit" do
    get edit_wellness_url(@wellness)
    assert_response :success
  end

  test "should update wellness" do
    patch wellness_url(@wellness), params: { wellness: { first_name: @wellness.first_name, last_name: @wellness.last_name, organization_id: @wellness.organization_id, q1: @wellness.q1, q2: @wellness.q2, q3: @wellness.q3, q4: @wellness.q4, reported: @wellness.reported, store_id: @wellness.store_id, tc: @wellness.tc, temp: @wellness.temp } }
    assert_redirected_to wellness_url(@wellness)
  end

  test "should destroy wellness" do
    assert_difference("Wellness.count", -1) do
      delete wellness_url(@wellness)
    end

    assert_redirected_to wellnesses_url
  end
end
