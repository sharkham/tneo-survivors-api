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
    byebug
    if user.save
      render json: user
    else
      resp = {
        error: user.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
    # render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
    end
  end

  # def update
  #   user = User.find(params[:id])
  #   if user.update(user_params)
  #     render json: user
  #     # render json: PokemonSerializer.new(novel).to_serialized_json, status: 200
  #   else
  #     render json: { status: 500 }
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:id, :name, :username, :password)
  end

end
