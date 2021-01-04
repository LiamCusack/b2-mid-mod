class ActorsController < ApplicationController
  def index
    @actors = Actor.order(age: :desc)
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def create
    Actor.create(actor_params)
    redirect_to '/actors'
  end

  private
  def actor_params
    params.permit(:name, :age)
  end
end
