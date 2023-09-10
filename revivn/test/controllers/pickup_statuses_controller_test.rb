require "test_helper"

class PickupStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup_status = pickup_statuses(:one)
  end

  test "should get index" do
    get pickup_statuses_url, as: :json
    assert_response :success
  end

  test "should create pickup_status" do
    assert_difference("PickupStatus.count") do
      post pickup_statuses_url, params: { pickup_status: { name: @pickup_status.name } }, as: :json
    end

    assert_response :created
  end

  test "should show pickup_status" do
    get pickup_status_url(@pickup_status), as: :json
    assert_response :success
  end

  test "should update pickup_status" do
    patch pickup_status_url(@pickup_status), params: { pickup_status: { name: @pickup_status.name } }, as: :json
    assert_response :success
  end

  test "should destroy pickup_status" do
    assert_difference("PickupStatus.count", -1) do
      delete pickup_status_url(@pickup_status), as: :json
    end

    assert_response :no_content
  end
end
