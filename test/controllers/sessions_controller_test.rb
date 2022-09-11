require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログイン画面" do
    get login_path
    assert_response :success
  end

  test "ログインできる" do
    post login_path, params: { session: { login: "user1", password: "P@ssw0rd" }}
    assert_redirected_to photos_path
    assert_equal "ログインしました", flash.notice
  end

  test "ユーザーIDとパスワードが未入力時のエラーメッセージ" do
    post login_path, params: { session: { login: "", password: "" }}
    assert_response :success
    assert_equal %w[ユーザーIDを入力してください パスワードを入力してください], flash.now[:danger]
  end

  test "ユーザーIDとパスワードが一致するユーザーいない場合のエラーメッセージ" do
    post login_path, params: { session: { login: "user", password: "P@ssw0rd" }}
    assert_response :success
    assert_equal %w[入力されたユーザーIDとパスワードに一致するユーザーが存在しません], flash.now[:danger]
  end
end
