class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    # @actors = Actor.all
  end
end
