require "test_helper"

class CovidStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @covid_status = covid_statuses(:one)
  end

  test "should get index" do
    get covid_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_covid_status_url
    assert_response :success
  end

  test "should create covid_status" do
    assert_difference("CovidStatus.count") do
      post covid_statuses_url, params: { covid_status: { first_name: @covid_status.first_name, last_name: @covid_status.last_name, organization_id: @covid_status.organization_id, status: @covid_status.status, store_id: @covid_status.store_id, timecard: @covid_status.timecard, user_id: @covid_status.user_id } }
    end

    assert_redirected_to covid_status_url(CovidStatus.last)
  end

  test "should show covid_status" do
    get covid_status_url(@covid_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_covid_status_url(@covid_status)
    assert_response :success
  end

  test "should update covid_status" do
    patch covid_status_url(@covid_status), params: { covid_status: { first_name: @covid_status.first_name, last_name: @covid_status.last_name, organization_id: @covid_status.organization_id, status: @covid_status.status, store_id: @covid_status.store_id, timecard: @covid_status.timecard, user_id: @covid_status.user_id } }
    assert_redirected_to covid_status_url(@covid_status)
  end

  test "should destroy covid_status" do
    assert_difference("CovidStatus.count", -1) do
      delete covid_status_url(@covid_status)
    end

    assert_redirected_to covid_statuses_url
  end
end
