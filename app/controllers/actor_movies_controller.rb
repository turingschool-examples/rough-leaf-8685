class ActorMoviesController < ApplicationController
  def create
    act = Actor.find_by(name: params[:name])
    app_mov = ActorMovie.create!(movie_id: params[:movie_id], actor_id: act.id)
    redirect_to "/movies/#{app_mov.movie_id}"
  end

  def actor_movies_params
    params.permit(:actor_id, :movie_id)
  end
end
