require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "有効なユーザー" do
    user = User.new(login: 'test1', password: 'P@ssw0rd')
    assert user.valid?
  end

  test "ユーザーIDなしの場合、無効" do
    user = User.new(login: '', password: 'P@ssw0rd')
    assert_not user.valid?
  end

  test "ユーザーIDが重複している場合、無効" do
    User.create(login: 'user', password: 'P@ssw0rd')
    user = User.new(login: 'user', password: 'P@ssw0rd')
    assert_not user.valid?
  end
end
