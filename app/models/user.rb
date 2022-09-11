class User < ApplicationRecord
  has_secure_password
  has_many :photos

  validates :login, presence: true, uniqueness: true
end
