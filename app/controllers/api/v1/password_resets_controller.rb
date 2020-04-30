class Api::V1::PasswordResetsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    byebug
    if user
      # user.send_password_reset
      #just for testing
      alert: "User exists"
    end
    #this sends regardless of whether there's an email in database for security reasons
    alert: "Email sent with password reset instructions."
  end
end
