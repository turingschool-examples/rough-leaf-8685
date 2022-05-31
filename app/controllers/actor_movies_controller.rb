class ActorMoviesController < ApplicationController
  def create
    # binding.pry
    ActorMovie.create!(actor_id: params[:id], movie_id: params[:movie_id])
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
