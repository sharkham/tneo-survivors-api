class User < ApplicationRecord
  has_many :novels
  has_secure_password

  validates :username, :name, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5, wrong_length: "Password must be at least 5 characters." }
end
