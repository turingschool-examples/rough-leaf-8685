class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @movie_actors = @movie.age_sort
  end
end
