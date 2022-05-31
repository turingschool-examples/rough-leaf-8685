class ActorMoviesController < ApplicationController
  def create
    app_mov = ActorMovie.create!(actor_movies_params)
    redirect_to "/movies/#{app_mov.movie_id}"
  end

  private

  def actor_movies_params
    params.permit(:actor_id, :movie_id)
  end
end
