class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.by_age.all
    @average_age = @actors.average_age
  end

end