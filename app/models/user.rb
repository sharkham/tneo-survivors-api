class User < ApplicationRecord
  has_many :novels
  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5, wrong_length: "Password must be at least 5 characters." }
end
