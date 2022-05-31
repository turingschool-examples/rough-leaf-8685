class MoviesController < ApplicationController
    def show
        @movie = Movie.find(params[:id])
    end

    def update
        movie = Movie.find(params[:id])
        actor = Actor.find_by(name: params[:add_actor])
        if actor != nil
            ActorMovie.create!(movie_id: movie.id, actor_id: actor.id)
        end
        redirect_to "/movies/#{movie.id}"
    end
    
    
end