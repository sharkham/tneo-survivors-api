class Api::V1::NovelsController < ApplicationController

  def index
    novels = Novel.all
    render json: NovelSerializer.new(novels).to_serialized_json, status: 200

  end

  def show
    novel = Novel.find(params[:id])
    render json: novel
    # render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
  end

  def create
    novel = Novel.new(novel_params)
    if novel.save
      render json: novel
    else
      render json: novel.errors, status: :unprocessable_entity
    # render json: TrainerSerializer.new(trainer).to_serialized_json, status: 200
    end
  end

  def update
    novel = Novel.find(params[:id])
    if novel.update(novel_params)
      render json: novel
      # render json: PokemonSerializer.new(novel).to_serialized_json, status: 200
    else
      render json: { status: 500 }
    end
  end

  private

  def novel_params
    params.require(:novel).permit(:id, :title, :summary, :plan, :goal, :wordcount, :year, :user_id)
  end

end
