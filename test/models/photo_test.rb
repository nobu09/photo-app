require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  setup do
    @photo = Photo.new(title: 'あ' * 30, user: User.find_by(login: 'user1'))
    @photo.image.attach(io: File.open(Rails.root.join('test/fixtures/files/test.png')), filename: 'test.png')
  end

  test "有効な写真" do
    assert @photo.valid?
  end

  test "タイトルなしの場合、無効" do
    @photo.title = ''
    assert_not @photo.valid?
  end

  test "タイトルが30文字超の場合、無効" do
    @photo.title = 'あ' * 31
    assert_not @photo.valid?
  end

  test "画像なしの場合、無効" do
    @photo.image.purge
    assert_not @photo.valid?
  end
end
