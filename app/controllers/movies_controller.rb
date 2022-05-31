class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:movie_id])
  end

  def update
    @movie = Movie.find(params[:movie_id])
    @movie.actors.find_or_create_by!(name: params[:actor])
    redirect_to action: 'show'
  end
end
