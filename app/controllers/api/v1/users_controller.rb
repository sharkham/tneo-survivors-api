class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: UserSerializer.new(users).to_serialized_json, status: 200
  end

  def show
    user = User.find(params[:id])
    # render json: user
    render json: UserSerializer.new(user).to_serialized_json, status: 200
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    # render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :username, :password)
  end

end
