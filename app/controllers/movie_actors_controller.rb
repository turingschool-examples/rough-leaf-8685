class MovieActorsController < ApplicationController
  def create
    actor = Actor.find_by(name: params[:actor_name])
    if actor.nil?
      redirect_to movie_path(params[:movie_id])
      flash[:alert] = "That doesn't seem to be a real actor..."
    else
      MovieActor.create!(movie_id: params[:movie_id], actor_id: actor.id)
      redirect_to movie_path(params[:movie_id])
      flash[:alert] = 'Actor successfully added!'
    end
  end
end
