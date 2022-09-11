class Photo < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validate :validate_presence_of_image

  private

  def validate_presence_of_image
    errors.add(:image, :blank) unless image.attached?
  end
end
