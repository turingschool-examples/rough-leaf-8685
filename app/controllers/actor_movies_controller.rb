class ActorMoviesController < ApplicationController
  def create
    ActorMovie.create(actor_id: params[:actor_id], movie_id: params[:movie_id])
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
