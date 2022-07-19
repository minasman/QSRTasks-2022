require "test_helper"

class TclassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tclass = tclasses(:one)
  end

  test "should get index" do
    get tclasses_url
    assert_response :success
  end

  test "should get new" do
    get new_tclass_url
    assert_response :success
  end

  test "should create tclass" do
    assert_difference("Tclass.count") do
      post tclasses_url, params: { tclass: { capacity: @tclass.capacity, class_date: @tclass.class_date, class_time: @tclass.class_time, curriculum_id: @tclass.curriculum_id, duration: @tclass.duration, expense: @tclass.expense, location: @tclass.location, name: @tclass.name } }
    end

    assert_redirected_to tclass_url(Tclass.last)
  end

  test "should show tclass" do
    get tclass_url(@tclass)
    assert_response :success
  end

  test "should get edit" do
    get edit_tclass_url(@tclass)
    assert_response :success
  end

  test "should update tclass" do
    patch tclass_url(@tclass), params: { tclass: { capacity: @tclass.capacity, class_date: @tclass.class_date, class_time: @tclass.class_time, curriculum_id: @tclass.curriculum_id, duration: @tclass.duration, expense: @tclass.expense, location: @tclass.location, name: @tclass.name } }
    assert_redirected_to tclass_url(@tclass)
  end

  test "should destroy tclass" do
    assert_difference("Tclass.count", -1) do
      delete tclass_url(@tclass)
    end

    assert_redirected_to tclasses_url
  end
end
