require "test_helper"

class OrganizaitonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organizaiton = organizaitons(:one)
  end

  test "should get index" do
    get organizaitons_url
    assert_response :success
  end

  test "should get new" do
    get new_organizaiton_url
    assert_response :success
  end

  test "should create organizaiton" do
    assert_difference("Organizaiton.count") do
      post organizaitons_url, params: { organizaiton: { city: @organizaiton.city, name: @organizaiton.name, phone: @organizaiton.phone, state: @organizaiton.state, street: @organizaiton.street, zip: @organizaiton.zip } }
    end

    assert_redirected_to organizaiton_url(Organizaiton.last)
  end

  test "should show organizaiton" do
    get organizaiton_url(@organizaiton)
    assert_response :success
  end

  test "should get edit" do
    get edit_organizaiton_url(@organizaiton)
    assert_response :success
  end

  test "should update organizaiton" do
    patch organizaiton_url(@organizaiton), params: { organizaiton: { city: @organizaiton.city, name: @organizaiton.name, phone: @organizaiton.phone, state: @organizaiton.state, street: @organizaiton.street, zip: @organizaiton.zip } }
    assert_redirected_to organizaiton_url(@organizaiton)
  end

  test "should destroy organizaiton" do
    assert_difference("Organizaiton.count", -1) do
      delete organizaiton_url(@organizaiton)
    end

    assert_redirected_to organizaitons_url
  end
end
