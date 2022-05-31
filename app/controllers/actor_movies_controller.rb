class ActorMoviesController < ApplicationController

  def create
    actor_id = Actor.find_by(name: params[:actor_name]).id
    ActorMovie.create!(movie_id: params[:movie_id], actor_id: actor_id)

    redirect_to "/movies/#{params[:movie_id]}"
  end
  
end
