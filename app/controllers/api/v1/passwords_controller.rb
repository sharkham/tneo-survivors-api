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

  def reset
    # byebug
    user = User.find_by(password_reset_token: params[:token], email: params[:email])

    if user.present? && user.password_token_valid?
      if user.reset_password(params[:password])
        render json: UserSerializer.new(@user).to_serialized_json, status: 200
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end

  # def reset
  #   token = params[:token].to_s

  #   if params[:email].blank?
  #     return render json: {error: 'Token not present'}
  #   end

  #   user = User.find_by(password_reset_token: token)

  #   if user.present? && user.password_token_valid?
  #     if user.reset_password!(params[:password])
  #       render json: {status: 'ok'}, status: :ok
  #     else
  #       render json: {error: user.errors.full_messages}, status: :unprocessable_entity
  #     end
  #   else
  #     render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
  #   end
  # end
end
