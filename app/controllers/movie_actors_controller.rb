class MovieActorsController < ApplicationController
  def create 
    movieactor = MovieActor.new(movie_id: params[:movie_id], actor_id: params[:actor_id])
    movieactor.save
    redirect_to "/movies/#{params[:movie_id]}"
  end
end