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
    novel = Novel.find_by(id: params[:novel_id])
    if novel.badges.any?{|novelBadge| novelBadge.badgetype_id === badge_params[:badgetype_id]}
      render json: error
    else
      badge = novel.badges.build(badge_params)
      if badge.save
        render json: badge, status: 200
      else
        render json: badge.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    Badge.find_by(id: params[:id]).destroy
  end

  private

  def badge_params
    params.require(:badge).permit(:id, :name, :description, :emoji, :novel_id, :badgetype_id)
  end
end
