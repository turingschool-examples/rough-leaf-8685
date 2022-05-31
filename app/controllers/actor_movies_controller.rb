class ActorMoviesController < ApplicationController

  def new

  end

  def create
    actor_movie = ActorMovie.new(actor_movie_params)
    redirect_to "/movie/#{params[:movie_id]}"
  end

  private
    def actor_movie_params
      params.permit(:movie_id, :actor_id)
    end

end
