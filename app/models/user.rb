class User < ApplicationRecord
  include UserHelpers
  has_many :novels
  has_secure_password

  validates :email, :name, presence: true
  # validates :name, presence: true
  # validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 5, wrong_length: "Password must be at least 5 characters." }

  def send_password_reset
    UserHelpers.generate_base64_token
    #   self.password_reset_token = UserHelpers.generate_base64_token # plain method lives in its own file
    #   self.password_reset_sent_at = Time.zone.now
    #   save!
    # UserMailer.password_reset(self).deliver
  end

end
