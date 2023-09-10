require "test_helper"

class PickupItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pickup_item = pickup_items(:one)
  end

  test "should get index" do
    get pickup_items_url, as: :json
    assert_response :success
  end

  test "should create pickup_item" do
    assert_difference("PickupItem.count") do
      post pickup_items_url, params: { pickup_item: { description: @pickup_item.description, hardware_type_id: @pickup_item.hardware_type_id, pickup_id: @pickup_item.pickup_id, quantity: @pickup_item.quantity } }, as: :json
    end

    assert_response :created
  end

  test "should show pickup_item" do
    get pickup_item_url(@pickup_item), as: :json
    assert_response :success
  end

  test "should update pickup_item" do
    patch pickup_item_url(@pickup_item), params: { pickup_item: { description: @pickup_item.description, hardware_type_id: @pickup_item.hardware_type_id, pickup_id: @pickup_item.pickup_id, quantity: @pickup_item.quantity } }, as: :json
    assert_response :success
  end

  test "should destroy pickup_item" do
    assert_difference("PickupItem.count", -1) do
      delete pickup_item_url(@pickup_item), as: :json
    end

    assert_response :no_content
  end
end
