class ActorsController < ApplicationController

  def new
  end

  def create
    actor = Actor.create(actor_params)
    actor_movie = ActorMovie.create(actor_movie_params)
    redirect_to "/actor_movie/new"
  end

  private
    def actor_params
      params.permit(:name, :age)
    end

    def actor_movie_params
      params.permit(:movie_id, :actor_id)
    end
end
