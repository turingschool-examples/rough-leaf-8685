class MoviesController < ApplicationController
  def show
    # binding.pry
    @movie = Movie.find(params[:id])
  end
end