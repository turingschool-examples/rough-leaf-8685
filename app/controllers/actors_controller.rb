class ActorsController < ApplicationController

  def new
  end

  def create
    actor = Actor.create(actor_params)
    redirect_to "/movie/#{@movie.id}"
  end

  private
    def actor_params
      params.permit(:name, :age, :movie_id)
    end


end
