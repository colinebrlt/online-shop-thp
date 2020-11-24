require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get line_items_create_url
    assert_response :success
  end

  test "should get update" do
    get line_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get line_items_destroy_url
    assert_response :success
  end

end
