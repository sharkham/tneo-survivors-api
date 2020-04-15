class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
    # render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
  end

  def create
    user = User.create(user_params)
    render json: user
    # render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :username, :password)
  end

end
