class MoviesController < ApplicationController
  def show
    @movies = Movie.find(params[:id])
  end
end
