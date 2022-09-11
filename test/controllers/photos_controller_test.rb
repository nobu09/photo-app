require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photos_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_url
    assert_response :success
  end
end
