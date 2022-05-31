class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    require 'pry'
    binding.pry
  end
end
