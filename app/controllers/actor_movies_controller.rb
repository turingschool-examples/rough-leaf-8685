class ActorMoviesController < ApplicationController

  def create
    # movie = Movie.find(params[:movie_id]) # unecessary to query the movie table
    actor = Actor.find_by(name: params[:name]) # define column in table
    ActorMovie.create!(actor_id: actor.id, movie_id: params[:movie_id]) # only need to create a record in the actor_movies table
    redirect_to "/movies/#{params[:movie_id]}"
  end

  def destroy
    actor = Actor.find_by(name: params[:name])
    ActorMovie.find_by(actor_id: actor.id, movie_id: params[:movie_id]).destroy
    redirect_to "/movies/#{params[:movie_id]}"
  end
end
