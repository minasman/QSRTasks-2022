require "test_helper"

class NewHiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_hire = new_hires(:one)
  end

  test "should get index" do
    get new_hires_url
    assert_response :success
  end

  test "should get new" do
    get new_new_hire_url
    assert_response :success
  end

  test "should create new_hire" do
    assert_difference("NewHire.count") do
      post new_hires_url, params: { new_hire: { attended: @new_hire.attended, background_na: @new_hire.background_na, background_ok: @new_hire.background_ok, background_received: @new_hire.background_received, birthdate: @new_hire.birthdate, comments: @new_hire.comments, email: @new_hire.email, first_name: @new_hire.first_name, hear: @new_hire.hear, last_name: @new_hire.last_name, notes: @new_hire.notes, organization_id: @new_hire.organization_id, phone: @new_hire.phone, position_id: @new_hire.position_id, rate: @new_hire.rate, referred_by: @new_hire.referred_by, rehire: @new_hire.rehire, requirements: @new_hire.requirements, social: @new_hire.social, store_id: @new_hire.store_id, user_id: @new_hire.user_id } }
    end

    assert_redirected_to new_hire_url(NewHire.last)
  end

  test "should show new_hire" do
    get new_hire_url(@new_hire)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_hire_url(@new_hire)
    assert_response :success
  end

  test "should update new_hire" do
    patch new_hire_url(@new_hire), params: { new_hire: { attended: @new_hire.attended, background_na: @new_hire.background_na, background_ok: @new_hire.background_ok, background_received: @new_hire.background_received, birthdate: @new_hire.birthdate, comments: @new_hire.comments, email: @new_hire.email, first_name: @new_hire.first_name, hear: @new_hire.hear, last_name: @new_hire.last_name, notes: @new_hire.notes, organization_id: @new_hire.organization_id, phone: @new_hire.phone, position_id: @new_hire.position_id, rate: @new_hire.rate, referred_by: @new_hire.referred_by, rehire: @new_hire.rehire, requirements: @new_hire.requirements, social: @new_hire.social, store_id: @new_hire.store_id, user_id: @new_hire.user_id } }
    assert_redirected_to new_hire_url(@new_hire)
  end

  test "should destroy new_hire" do
    assert_difference("NewHire.count", -1) do
      delete new_hire_url(@new_hire)
    end

    assert_redirected_to new_hires_url
  end
end
