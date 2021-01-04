class MoviesController < ApplicationController
  def index
    @movies = Movie.order(:name)
  end

  def show
    @movie = Movie.find(params[:id])
    if params[:search]
        @searched_actor = Actor.where(name: "#{params[:search].downcase}")
        MovieActor.create(movie_id: @movie.id, actor_id: @searched_actor.id)
      end
  end

  def create
    Movie.create(movie_params)
    redirect_to '/movies'
  end

  private
  def movie_params
    params.permit(:title, :creation_year, :genre)
  end
end
