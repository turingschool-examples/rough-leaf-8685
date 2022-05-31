class MovieActorsController < ApplicationController
  def create 
    actor = Actor.find_by(name: params[:actor_name])
    MovieActor.create(actor: actor, movie_id: params[:movie_id])
    redirect_to "/movies/#{params[:movie_id]}"
  end
end