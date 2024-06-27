require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "ログイン中のみ写真一覧画面を表示" do
    get photos_path
    assert_redirected_to login_path

    post login_path, params: { session: { login: "user1", password: "P@ssw0rd" } }

    get photos_path
    assert_response :success
  end

  test "ログイン中のみ写真アップロード画面を表示" do
    get new_photo_path
    assert_redirected_to login_path

    post login_path, params: { session: { login: "user1", password: "P@ssw0rd" } }

    get new_photo_path
    assert_response :success
  end

  test "写真をアップロードできる" do
    post login_path, params: { session: { login: "user1", password: "P@ssw0rd" } }
    post photos_path, params: {
      photo: {
        title: "テスト画像",
        image: fixture_file_upload("test.png", "image/png")
      }
    }

    assert_equal 1, User.find_by(login: "user1").photos.count
    assert_redirected_to photos_path
    assert_equal "写真をアップロードしました", flash.notice
  end

  test "写真アップロードでエラー" do
    post login_path, params: { session: { login: "user1", password: "P@ssw0rd" } }
    post photos_path, params: {
      photo: { title: "", image: nil }
    }

    assert_equal 0, User.find_by(login: "user1").photos.count
    assert_response :success
  end
end
