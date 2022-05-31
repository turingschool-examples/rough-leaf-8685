class MoviesController < ApplicationController

  def show
    @movies = Studio.find(params[:movie_id])
  end
end
