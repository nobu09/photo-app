require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  test "有効な写真" do
    photo = Photo.new(title: 'あ' * 30)
    assert photo.valid?
  end

  test "タイトルなしの場合、無効" do
    photo = Photo.new(title: '')
    assert_not photo.valid?
  end

  test "タイトルが30文字超の場合、無効" do
    photo = Photo.new(title: 'あ' * 31)
    assert_not photo.valid?
  end
end
