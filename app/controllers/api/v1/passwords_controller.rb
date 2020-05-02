class Api::V1::PasswordsController < ApplicationController
  def forgot
    user = User.find_by(email: params[:_json])
    # byebug
    if user
      render json: {
        alert: "User exists!"
      }
      user.send_password_reset
      #just for testing
    else
      render json: {
        alert: "No user!"
      }
    end
    #this sends regardless of whether there's an email in database for security reasons
    # render json: {
    #   alert: "Email sent with password reset instructions."
    # }
  end
end
