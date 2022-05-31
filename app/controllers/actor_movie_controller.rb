class ActorMovieController < ApplicationController

  def create
    ActorMovie.create(movie_id: params[:movie_id], actor_id: Actor.find_by_name(params[:name]).id)
    redirect_to "/movies/#{params[:movie_id]}"
  end

end
