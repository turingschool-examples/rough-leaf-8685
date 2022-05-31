class ActorMoviesController < ApplicationController
  def create
    @actor = Actor.where(name: params[:name]).first
    ActorMovie.create!(actor_id: @actor.id, movie_id: params[:movie_id])
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
