class MovieActorsController < ApplicationController
  def create
    actor = Actor.find_by(name: params[:actor_name])
    MovieActor.create!(movie_id: params[:movie_id], actor_id: actor.id)
    redirect_to movie_path(params[:movie_id])
  end
end
