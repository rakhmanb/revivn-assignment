require "test_helper"

class PickupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup = pickups(:one)
  end

  test "should get index" do
    get pickups_url, as: :json
    assert_response :success
  end

  test "should create pickup" do
    assert_difference("Pickup.count") do
      post pickups_url, params: { pickup: { address: @pickup.address, address2: @pickup.address2, city: @pickup.city, integer: @pickup.integer, org_id: @pickup.org_id, pickup_datetime: @pickup.pickup_datetime, state: @pickup.state, user_id: @pickup.user_id, zip: @pickup.zip } }, as: :json
    end

    assert_response :created
  end

  test "should show pickup" do
    get pickup_url(@pickup), as: :json
    assert_response :success
  end

  test "should update pickup" do
    patch pickup_url(@pickup), params: { pickup: { address: @pickup.address, address2: @pickup.address2, city: @pickup.city, integer: @pickup.integer, org_id: @pickup.org_id, pickup_datetime: @pickup.pickup_datetime, state: @pickup.state, user_id: @pickup.user_id, zip: @pickup.zip } }, as: :json
    assert_response :success
  end

  test "should destroy pickup" do
    assert_difference("Pickup.count", -1) do
      delete pickup_url(@pickup), as: :json
    end

    assert_response :no_content
  end
end
