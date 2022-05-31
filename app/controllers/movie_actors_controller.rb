class MovieActorsController < ApplicationController
  
  def new 
  end

  def create 
    @movie = Movie.find(params[:movie_id])
    @actor = Actor.search(params[:name])
    MovieActor.create!(movie_id: params[:movie_id], actor_id: @actor.first.id)
    redirect_to "/movies/#{params[:movie_id]}" 
  end
end