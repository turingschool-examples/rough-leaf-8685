class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @movie_actors = if !params[:actors_by_name].nil? && params[:actors_by_name] != ""
                      Actor.where('lower(name) LIKE?', "%#{params[:actors_by_name].downcase}%")
                    else
                      []
                    end
  end
end
