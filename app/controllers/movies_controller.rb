class MoviesController < ApplicationController
    def show
        @movie = Movie.find(params[:movie_id])
    end

    def add_actor
        movie = Movie.find(params[:movie_id])
        actor_id = Actor.select("id").where("name LIKE ?", "%#{params[:name]}%") 
        MovieActor.create!(movie_id: movie.id, actor_id: actor_id)
        redirect_to "/movies/#{params[:movie_id]}"
    end

end