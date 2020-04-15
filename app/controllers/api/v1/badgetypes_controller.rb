class BadgetypesController < ApplicationController
  def index
    badgetypes = Entry.all
    render json: badgetypes, status: 200
  end

  def show
    badgetype = Badgetype.find(params[:id])
    render json: badgetype, status: 200
  end

  def create
    badgetype = Badgetype.create(badgetype_params)
    render json: badgetype, status: 200
  end

  private

  def badgetype_params
    params.require(:badgetype).permit(:id, :name, :description, :emoji)
  end
end
