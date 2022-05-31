class MovieActorsController < ApplicationController
  def create 
    # binding.pry
    movieactor = MovieActor.create(movie_id: params[:id], actor_id: params[:actor_id])
    redirect_to "/movies/#{params[:id]}"
  end
end