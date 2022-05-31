class MovieController < ApplicationController

  def show
    @movie = Movie.find(params[:movie_id])
  end

end
