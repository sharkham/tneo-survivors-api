class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  # def show
  #   trainer = Trainer.find(params[:id])
  #   render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
  # end

  # def create
  #   trainer = Trainer.create(trainer_params)
  #   render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
  # end

  # def update
  #   @trainer = Trainer.find(params[:id])
  #   if @trainer.update(trainer_params)
  #     render json: TrainerSerializer.new(@trainer).to_serialized_json, status: 200
  #   else
  #     render json: { status: 500 }
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:id, :name, :username, :password)
  end

end
