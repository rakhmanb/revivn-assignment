require "test_helper"

class HardwareTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hardware_type = hardware_types(:one)
  end

  test "should get index" do
    get hardware_types_url, as: :json
    assert_response :success
  end

  test "should create hardware_type" do
    assert_difference("HardwareType.count") do
      post hardware_types_url, params: { hardware_type: { name: @hardware_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show hardware_type" do
    get hardware_type_url(@hardware_type), as: :json
    assert_response :success
  end

  test "should update hardware_type" do
    patch hardware_type_url(@hardware_type), params: { hardware_type: { name: @hardware_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy hardware_type" do
    assert_difference("HardwareType.count", -1) do
      delete hardware_type_url(@hardware_type), as: :json
    end

    assert_response :no_content
  end
end
