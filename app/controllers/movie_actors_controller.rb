class MovieActorsController < ApplicationController

  def create
    actor = Actor.find_by(name: params[:name]).id
    MovieActor.create!(movie_id: params[:id], actor_id: actor)
    redirect_to "/movies/#{params[:id]}"
  end

end
