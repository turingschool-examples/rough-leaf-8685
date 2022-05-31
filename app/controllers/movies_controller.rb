class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors.by_age.all
    @average_age = @actors.average_age
  end

  def create
    @actor = Actor.find(params[name:])  #need to figure out how to find @actor with attribute other than id
    @movie = Movie.find(params[:id])
    new_actormovie = ActorMovie.create(actor_id: @actor.id, movie_id: @movie.id)
      if new_actormovie.save 
        redirect_to"/movies/#{@movie.id}"
      else
      flash[:notice] = "Actor could not be added. Please check your spelling"
      redirect_to "/movies/#{@movie.id}"
      end
  end
end