class Api::V1::BadgesController < ApplicationController
  def index
    badges = Badge.all
    render json: badges, status: 200
  end

  def show
    badge = Badge.find(params[:id])
    render json: badge, status: 200
  end

  def create
    badge = Novel.find_by(id: params[:novel_id]).badges.build(badge_params)
    if badge.save
      render json: badge, status: 200
    else
      render json: badge.errors, status: :unprocessable_entity
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:id, :name, :description, :emoji, :novel_id, :badgetype_id)
  end
end
