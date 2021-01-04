class StudiosController < ApplicationController
  def index
    @studios = Studio.order(:name)
  end

  def show
    @studio = Studio.find(params[:id])
  end

  def create
    Studio.create(studio_params)
    redirect_to '/studios'
  end

  private
  def studio_params
    params.permit(:name)
  end
end
