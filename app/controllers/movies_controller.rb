class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    # @actors = Actor.find(params[:actor_id])
  end
end
