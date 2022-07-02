require "application_system_test_case"

class StoresTest < ApplicationSystemTestCase
  setup do
    @store = stores(:one)
  end

  test "visiting the index" do
    visit stores_url
    assert_selector "h1", text: "Stores"
  end

  test "should create store" do
    visit stores_url
    click_on "New store"

    fill_in "Active", with: @store.active
    fill_in "City", with: @store.city
    fill_in "Email", with: @store.email
    fill_in "Headset", with: @store.headset
    fill_in "Name", with: @store.name
    fill_in "Number", with: @store.number
    fill_in "Organization", with: @store.organization_id
    fill_in "Phone", with: @store.phone
    fill_in "Safe", with: @store.safe
    fill_in "State", with: @store.state
    fill_in "Store type", with: @store.store_type
    fill_in "Street", with: @store.street
    fill_in "Zip", with: @store.zip
    click_on "Create Store"

    assert_text "Store was successfully created"
    click_on "Back"
  end

  test "should update Store" do
    visit store_url(@store)
    click_on "Edit this store", match: :first

    fill_in "Active", with: @store.active
    fill_in "City", with: @store.city
    fill_in "Email", with: @store.email
    fill_in "Headset", with: @store.headset
    fill_in "Name", with: @store.name
    fill_in "Number", with: @store.number
    fill_in "Organization", with: @store.organization_id
    fill_in "Phone", with: @store.phone
    fill_in "Safe", with: @store.safe
    fill_in "State", with: @store.state
    fill_in "Store type", with: @store.store_type
    fill_in "Street", with: @store.street
    fill_in "Zip", with: @store.zip
    click_on "Update Store"

    assert_text "Store was successfully updated"
    click_on "Back"
  end

  test "should destroy Store" do
    visit store_url(@store)
    click_on "Destroy this store", match: :first

    assert_text "Store was successfully destroyed"
  end
end
